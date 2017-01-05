package com.le.leface.dao;

import java.util.List;

import com.le.leface.models.VideoAnnotation;

public interface VideoAnnotationDao {

	public List<VideoAnnotation> findVideoAnnotationByVideoId(String videoId);
    
	public List<VideoAnnotation> findVideoAnnotationByTimestamp(String videoId, int timestamp);
    
}
