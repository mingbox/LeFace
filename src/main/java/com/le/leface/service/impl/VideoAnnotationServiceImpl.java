package com.le.leface.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.le.leface.dao.VideoAnnotationDao;
import com.le.leface.models.VideoAnnotation;
import com.le.leface.service.VideoAnnotationService;

@Service
public class VideoAnnotationServiceImpl implements VideoAnnotationService {
	
	@Autowired
	private VideoAnnotationDao videoAnnotationDao;

	@Transactional
	public List<VideoAnnotation> getVideoInfoByVideoId(String videoId) {
		return videoAnnotationDao.findVideoAnnotationByVideoId(videoId);
	}

	@Transactional
	public List<VideoAnnotation> getVideoInfoByTimestamp(String videoId, int timestamp) {
		return videoAnnotationDao.findVideoAnnotationByTimestamp(videoId, timestamp);
	}
}
