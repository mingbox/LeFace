package com.le.leface.service.impl;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.facepp.error.FaceppParseException;
import com.facepp.http.HttpRequests;
import com.facepp.http.PostParameters;
import com.le.leface.service.FaceDetectService;
@Service
public class FaceDetectServiceFacePPImpl implements FaceDetectService {

	//private static HttpRequests httpRequests = new HttpRequests("43a4489d167edfc5a51bc0c0fbea2e02", "mHuNxOtYtDJatlNl_rDoMho29tz_Qq-n", false, false);
	private static HttpRequests httpRequests = new HttpRequests("4f33cd7501622289c035eff22485ee06", "fKJlcYWfUxjE1i1Doo6OoLgIx8DhNa-2", true, false);
	
	private static final String GROUP_NAME="group_0";
	private static final String MODE="oneface";
	
	@Override
	public String identify(byte[] img) {
		try {
			JSONObject syncRet = httpRequests.recognitionIdentify(new PostParameters().setGroupName(GROUP_NAME).setImg(img).setMode(MODE));
			if(syncRet!=null){
				JSONObject person=(JSONObject)syncRet.getJSONArray("face").getJSONObject(0).getJSONArray("candidate").getJSONObject(0);
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
	public String detect(String name, byte[] img) {
		try {
			JSONObject result = httpRequests.detectionDetect(new PostParameters().setImg(img).setMode(MODE));
			if(result!=null){
				JSONObject face=(JSONObject)result.getJSONArray("face").getJSONObject(0);
				String faceId=face.getString("face_id");
				JSONObject personResult =httpRequests.personCreate(new PostParameters().setGroupName(GROUP_NAME).setFaceId(faceId));
				JSONObject trainResult =httpRequests.trainIdentify(new PostParameters().setGroupName(GROUP_NAME));
				System.out.println(trainResult);
				return personResult.getString("person_id");
			}
		} catch (FaceppParseException | JSONException e) {
			e.printStackTrace();
		}
		return null;
	}

}
