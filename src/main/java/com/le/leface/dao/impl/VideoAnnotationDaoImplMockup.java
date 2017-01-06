package com.le.leface.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.le.leface.dao.AbstractDao;
import com.le.leface.dao.VideoAnnotationDao;
import com.le.leface.models.VideoAnnotation;

@Repository
public class VideoAnnotationDaoImplMockup extends AbstractDao<Long, VideoAnnotation> implements VideoAnnotationDao {
	
	private static List<VideoAnnotation> dbMockup;
	
	static {
		dbMockup = new ArrayList<VideoAnnotation>();
		Integer id = 1;
		
		addToDB(id.toString(), "F4g7IQWicAg", "Auto", "Chevrolet ZR2", new float[] { 20, 5, 80, 50 }, 25000, 38000);
		id++;

		addToDB(id.toString(), "F4g7IQWicAg", "Auto", "Honda Civic Si", new float[] { 20, 5, 80, 50 }, 40000, 51000);
		id++;

		addToDB(id.toString(), "F4g7IQWicAg", "Auto", "Alfa Romeo Stelvio", new float[] { 5, 5, 80, 80 }, 53000, 71000);
		id++;

		addToDB(id.toString(), "F4g7IQWicAg", "Auto", "Juguar I-Pace", new float[] { 35, 35, 35, 35 }, 72000, 85000);
		id++;

		addToDB(id.toString(), "F4g7IQWicAg", "Auto", "Porsche 911 RSR", new float[] { 35, 35, 50, 50 }, 86000, 99000);
		id++;

		addToDB(id.toString(), "F4g7IQWicAg", "Auto", "Toyota C-HR", new float[] { 20, 5, 50, 50 }, 100000, 109000);
		id++;

		addToDB(id.toString(), "lKLBmF-B0I4", "Attraction", "Nice France", new float[] { 0, 0, 100, 100 }, 0, 30000);
		id++;

		addToDB(id.toString(), "lKLBmF-B0I4", "Attraction", "Aix-en-Provence France", new float[] { 0, 0, 100, 100 },
				33000, 79000);
		id++;

		addToDB(id.toString(), "lKLBmF-B0I4", "Attraction", "Marseille France", new float[] { 0, 0, 100, 100 }, 81000,
				160000);
		id++;

		addToDB(id.toString(), "lKLBmF-B0I4", "Attraction", "Carcassonne France", new float[] { 0, 0, 100, 100 },
				167000, 190000);
		id++;

		addToDB(id.toString(), "lKLBmF-B0I4", "Attraction", "Montpellier France", new float[] { 0, 0, 100, 100 },
				193000, 208000);
		id++;

		addToDB(id.toString(), "frdj1zb9sMY", "Actor", "Felicity Jones", new float[] { 40, 0, 20, 100 },
				6000, 7000);
		id++;

		addToDB(id.toString(), "frdj1zb9sMY", "Actor", "Forest Whitaker", new float[] { 40, 0, 50, 100 },
				7000, 8000);
		id++;

		addToDB(id.toString(), "frdj1zb9sMY", "Actor", "Felicity Jones", new float[] { 40, 0, 20, 100 },
				18000, 40000);
		id++;

		addToDB(id.toString(), "frdj1zb9sMY", "Actor", "Diego Luna", new float[] { 40, 0, 20, 100 },
				20000, 42000);
		id++;

		addToDB(id.toString(), "frdj1zb9sMY", "Actor", "Wen Jiang", new float[] { 30, 0, 40, 100 },
				47000, 50000);
		id++;

		addToDB(id.toString(), "frdj1zb9sMY", "Actor", "Donnie Yen", new float[] { 50, 10, 20, 90 },
				53000, 59000);
		id++;

		addToDB(id.toString(), "frdj1zb9sMY", "Actor", "Felicity Jones", new float[] { 50, 20, 20, 80 },
				60000, 64000);
		id++;

		addToDB(id.toString(), "frdj1zb9sMY", "Actor", "Alan Tudyk", new float[] { 0, 0, 50, 100 },
				60000, 64000);
		id++;

		addToDB(id.toString(), "frdj1zb9sMY", "Toy", "K-2SO", new float[] { 0, 0, 50, 100 },
				60000, 64000);
		id++;

		addToDB(id.toString(), "frdj1zb9sMY", "Toy", "Death Star", new float[] { 10, 0, 40, 90 },
				67000, 70000);
		id++;

		addToDB(id.toString(), "frdj1zb9sMY", "Toy", "X-Wing", new float[] { 50, 0, 30, 70 },
				90000, 93000);
		id++;

		addToDB(id.toString(), "frdj1zb9sMY", "Actor", "Felicity Jones", new float[] { 40, 0, 20, 100 },
				97000, 110000);
		id++;

		addToDB(id.toString(), "frdj1zb9sMY", "Toy", "Darth Vader", new float[] { 40, 0, 30, 100 },
				1160000, 118000);
		id++;

	}
	
	static void addToDB(String id, String videoId, String key, String value, 
			float[] coordinates, int startTime, int endTime) {
		VideoAnnotation vi = new VideoAnnotation();
		vi.setId(id);
		vi.setVideoId(videoId);
		vi.setKey(key);
		vi.setValue(value);
		vi.setCoordinates(coordinates);
		vi.setStartTime(startTime);
		vi.setEndTime(endTime);
		dbMockup.add(vi);
	}

	@Override
	public List<VideoAnnotation> findVideoAnnotationByVideoId(String videoId) {
		List<VideoAnnotation> listVI = new ArrayList<VideoAnnotation>();
		
		for (VideoAnnotation vi : dbMockup) {
			if (vi.getVideoId().equals(videoId)) {
				listVI.add(vi);
			}
		}
		
		return listVI;
	}

	@Override
	public List<VideoAnnotation> findVideoAnnotationByTimestamp(String videoId, int timestamp) {
		List<VideoAnnotation> listVI = findVideoAnnotationByVideoId(videoId);
		List<VideoAnnotation> listVIT = new ArrayList<VideoAnnotation>();
		
		for (VideoAnnotation vi : listVI) {
			if (timestamp < vi.getStartTime() || timestamp > vi.getEndTime()) continue;
			listVIT.add(vi);
		}
		
		return listVIT;
	}

}
