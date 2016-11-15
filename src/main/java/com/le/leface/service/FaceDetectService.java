package com.le.leface.service;

public interface FaceDetectService {
	public String identify(byte[] img);
	public String detect(String name,byte[] img);
}
