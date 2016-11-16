package com.le.leface.service;

import java.util.List;

import org.json.JSONObject;

public interface FaceDetectService {
	public String identify(byte[] img);
	public String detect(String name,List<byte[]> imgList);
	public JSONObject getPersonList();
	public void removePerson(String personId);
	public void removeAllPersons();
}
