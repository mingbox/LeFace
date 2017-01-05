package com.le.leface.service;

import java.util.List;

import com.le.leface.models.VideoAnnotation;

public interface VideoAnnotationService {
	
	public List<VideoAnnotation> getVideoInfoByVideoId(String videoId);

	public List<VideoAnnotation> getVideoInfoByTimestamp(String videoId, int timestamp);
}
