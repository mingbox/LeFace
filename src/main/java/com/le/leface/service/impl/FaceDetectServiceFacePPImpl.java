package com.le.leface.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.facepp.error.FaceppParseException;
import com.facepp.http.HttpRequests;
import com.facepp.http.PostParameters;
import com.le.leface.service.FaceDetectService;

@Service
public class FaceDetectServiceFacePPImpl implements FaceDetectService {

	// private static HttpRequests httpRequests = new
	// HttpRequests("43a4489d167edfc5a51bc0c0fbea2e02",
	// "mHuNxOtYtDJatlNl_rDoMho29tz_Qq-n", false, false);
	private static HttpRequests httpRequests = new HttpRequests("4f33cd7501622289c035eff22485ee06",
			"fKJlcYWfUxjE1i1Doo6OoLgIx8DhNa-2", true, false);

	private static final String GROUP_NAME = "group_0";
	private static final String MODE = "oneface";

	@Override
	public String identify(byte[] img) {
		String result="";
		try {
			JSONObject syncRet = httpRequests
					.recognitionIdentify(new PostParameters().setGroupName(GROUP_NAME).setImg(img).setMode("normal"));
			if (syncRet != null) {
				int numPerson=detectNumPerson(img);
				int numResult=syncRet.getJSONArray("face").length();
				if(numPerson==0||numResult>numPerson){
					numResult=numPerson;
				}
				for(int i=0;i<numResult;i++){
					JSONObject person = (JSONObject) syncRet.getJSONArray("face").getJSONObject(i).getJSONArray("candidate").getJSONObject(0);
					Double confidence = person.getDouble("confidence");
					if (confidence.doubleValue() > 30) {
						result+=person.getString("tag")+",";
					}
				}
				if(result.length()>0){
					result=result.substring(0, result.length()-1);
				}
			}
		} catch (FaceppParseException | JSONException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int detectNumPerson(byte[] img) {
		int num = 0;
		try {
			JSONObject result = httpRequests.detectionDetect(new PostParameters().setImg(img).setMode("normal"));
			if (result != null) {
				num = result.getJSONArray("face").length();
			}
		} catch (FaceppParseException | JSONException e) {
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public String detect(String name, List<byte[]> imgList) {
		try {
			ArrayList<String> faceList = new ArrayList<String>();
			for (byte[] img : imgList) {
				JSONObject result = httpRequests.detectionDetect(new PostParameters().setImg(img).setMode(MODE));
				if (result != null) {
					JSONObject face = (JSONObject) result.getJSONArray("face").getJSONObject(0);
					faceList.add(face.getString("face_id"));
				}
			}
			JSONObject personResult = httpRequests
					.personCreate(new PostParameters().setGroupName(GROUP_NAME).setFaceId(faceList).setTag(name));
			trainGroup();
			return personResult.getString("person_id");
		} catch (FaceppParseException | JSONException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public JSONObject getPersonList() {
		JSONObject result = null;
		try {
			result = httpRequests.infoGetPersonList();
		} catch (FaceppParseException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void removePerson(String personId) {
		try {
			httpRequests.personDelete(new PostParameters().setPersonId(personId));
			trainGroup();
		} catch (FaceppParseException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void removeAllPersons() {
		JSONObject result = getPersonList();
		ArrayList<String> personIds = new ArrayList<String>();
		try {
			JSONArray personList;
			personList = result.getJSONArray("person");
			for (int i = 0; i < personList.length(); i++) {
				personIds.add(personList.getJSONObject(i).getString("person_id"));
			}
			httpRequests.personDelete(new PostParameters().setPersonId(personIds));
			trainGroup();
		} catch (JSONException | FaceppParseException e) {
			e.printStackTrace();
		}
	}

	public void trainGroup() {
		JSONObject trainResult;
		try {
			trainResult = httpRequests.trainIdentify(new PostParameters().setGroupName(GROUP_NAME));
			System.out.println(trainResult);
		} catch (FaceppParseException e) {
			e.printStackTrace();
		}
	}

}
