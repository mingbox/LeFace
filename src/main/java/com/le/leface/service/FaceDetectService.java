package com.le.leface.service;

public interface FaceDetectService {
	public String identify(byte[] img);
	public void detect(String name,byte[] img);
}
