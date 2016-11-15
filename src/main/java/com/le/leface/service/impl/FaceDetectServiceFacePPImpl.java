package com.le.leface.service.impl;

import java.util.ArrayList;
import java.util.UUID;

import org.json.JSONException;
import org.json.JSONObject;

import com.facepp.error.FaceppParseException;
import com.facepp.http.HttpRequests;
import com.facepp.http.PostParameters;
import com.le.leface.service.FaceDetectService;

public class FaceDetectServiceFacePPImpl implements FaceDetectService {
	
	private static HttpRequests httpRequests = new HttpRequests("43a4489d167edfc5a51bc0c0fbea2e02", "mHuNxOtYtDJatlNl_rDoMho29tz_Qq-n", false, true);
	private static final String GROUP_NAME="group_0";
	private static final String MODE="oneface";
	
	@Override
	public String identify(byte[] img) {
		try {
			JSONObject syncRet = httpRequests.recognitionIdentify(new PostParameters().setGroupName(GROUP_NAME).setImg(img).setMode(MODE));
			if(syncRet!=null){
				JSONObject person=(JSONObject)syncRet.getJSONObject("face").getJSONArray("candidate").getJSONObject(0);
				Double confidence=person.getDouble("confidence");
				String personId=person.getString("person_id");
				if(confidence.doubleValue()>90){
					return personId;
				}
			}
		} catch (FaceppParseException | JSONException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void detect(String name, byte[] img) {
		try {
			JSONObject result = httpRequests.detectionDetect(new PostParameters().setImg(img).setMode(MODE));
			if(result!=null){
				JSONObject face=(JSONObject)result.getJSONArray("face").getJSONObject(0);
				String face_id=face.getString("face_id");
				String personName=UUID.randomUUID().toString();
				httpRequests.personCreate(new PostParameters().setPersonName(personName));
				httpRequests.personAddFace(new PostParameters().setPersonName(personName).setFaceId(face_id));
				ArrayList<String> personList = new ArrayList<String>();
				personList.add(personName);
				httpRequests.groupAddPerson(new PostParameters().setGroupName(GROUP_NAME).setPersonName(personList));
				httpRequests.trainIdentify(new PostParameters().setGroupName(GROUP_NAME));
			}
		} catch (FaceppParseException | JSONException e) {
			e.printStackTrace();
		}
	}

}
