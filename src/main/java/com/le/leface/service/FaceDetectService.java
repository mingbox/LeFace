package com.le.leface.service;

import java.util.List;

public interface FaceDetectService {
	public String identify(byte[] img);
	public String detect(String name,List<byte[]> imgList);
}
