package com.le.leface.models;

public class VideoAnnotation {

	private String id;
	
	private String videoId;
	
	private float[] coordinates;
	
	private String key;
	
	private String value;
	
	private int startTime;
	
	private int endTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public float[] getCoordinates() {
		return coordinates;
	}

	public void setCoordinates(float[] coordinates) {
		this.coordinates = coordinates;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int getStartTime() {
		return startTime;
	}

	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}

	public int getEndTime() {
		return endTime;
	}

	public void setEndTime(int endTime) {
		this.endTime = endTime;
	}
}
