package com.le.leface.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.le.leface.dao.AbstractDao;
import com.le.leface.dao.VideoAnnotationDao;
import com.le.leface.models.VideoAnnotation;

public class VideoAnnotationDaoImpl extends AbstractDao<Long, VideoAnnotation> implements VideoAnnotationDao {
	
	@Override
	@SuppressWarnings("unchecked")
	public List<VideoAnnotation> findVideoAnnotationByVideoId(String videoId) {
        Criteria criteria = createEntityCriteria();
	    criteria.add(Restrictions.eq("videoId", videoId));
		return (List<VideoAnnotation>) criteria.list();
	}

	@Override
	public List<VideoAnnotation> findVideoAnnotationByTimestamp(String videoId, int timestamp) {
		List<VideoAnnotation> listVA = findVideoAnnotationByVideoId(videoId);
		List<VideoAnnotation> listVAT = new ArrayList<VideoAnnotation>();
		
		for (VideoAnnotation vi : listVA) {
			if (timestamp < vi.getStartTime() || timestamp > vi.getEndTime()) continue;
			listVAT.add(vi);
		}
		
		return listVAT;
	}

}
