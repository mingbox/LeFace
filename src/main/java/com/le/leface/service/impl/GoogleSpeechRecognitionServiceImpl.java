package com.le.leface.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import org.apache.commons.codec.binary.Base64;
import org.apache.http.entity.StringEntity;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.le.leface.service.SpeechRecognitionService;

@Service
public class GoogleSpeechRecognitionServiceImpl implements SpeechRecognitionService {
	
	private static final String authKey = "AIzaSyDdfibbs0Y23bTq2gcV-QfRvYsW7iot1Q8";
	private static final String endpoint = "https://speech.googleapis.com/v1beta1/";

	private JSONObject request(String control, String action, JSONObject payload) {
		URL url;
		HttpURLConnection urlConn = null;
		JSONObject result = null;
		try {
			url = new URL(endpoint + control + ":" + action + "?key=" + authKey);
			urlConn = (HttpURLConnection) url.openConnection();
	        urlConn.setRequestMethod("POST");
	        urlConn.setConnectTimeout(30000);
	        urlConn.setReadTimeout(30000);
	        urlConn.setDoOutput(true);

	        urlConn.setRequestProperty("Content-Type", "application/json");
	        urlConn.setRequestProperty("Content-Length", Integer.toString(payload.length()));
	        
	        StringEntity reqEntity = new StringEntity(payload.toString());
	        reqEntity.writeTo(urlConn.getOutputStream());
            
            String resultString = null;
            if (urlConn.getResponseCode() == 200)
            	resultString = readString(urlConn.getInputStream());
            else
            	resultString = readString(urlConn.getErrorStream());
            System.out.println(resultString);
	        
            result = new JSONObject(resultString);

            result.put("response_code", urlConn.getResponseCode());
            urlConn.getInputStream().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	private static String readString(InputStream is) {
		StringBuffer rst = new StringBuffer();
		
		byte[] buffer = new byte[1048576];
		int len = 0;
		try {
			while ((len = is.read(buffer)) > 0)
				rst.append(new String(buffer, 0, len, "UTF-8"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return rst.toString();
	}
	
	private String encodeFileToBase64Binary(String audioFilePath){
	    String encodedfile = null;
	    try {
	    	File file = new File(audioFilePath);
	        FileInputStream fileInputStreamReader = new FileInputStream(file);
	        byte[] bytes = new byte[(int)file.length()];
	        fileInputStreamReader.read(bytes);
	        encodedfile = new String(Base64.encodeBase64(bytes));
	        fileInputStreamReader.close();
			return encodedfile;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	   return null;
	}
	
	@Override
	public String speechFileToText(String audioFilePath) {
		StringBuffer sb = new StringBuffer();
		try {
			JSONObject payload = new JSONObject();
			JSONObject config = new JSONObject();
			config.put("encoding", "LINEAR16");
			config.put("sampleRate", 16000);
			config.put("languageCode", "en-US");
			payload.put("config", config);
			JSONObject audio = new JSONObject();
			audio.put("content", encodeFileToBase64Binary(audioFilePath));
			payload.put("audio", audio);
			JSONObject result = request("speech", "syncrecognize", payload);
			JSONArray alternatives = result.getJSONArray("results");
			for (int i = 0; i < alternatives.length(); i++) {
				sb.append(alternatives.getJSONObject(i).getJSONArray("alternatives").getJSONObject(0).getString("transcript"));
				sb.append("\n");
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}

		return sb.toString();
	}
	
	public static void main(String[] args) {
		GoogleSpeechRecognitionServiceImpl g = new GoogleSpeechRecognitionServiceImpl();
		String s = g.speechFileToText("whatstheweatherlike.wav");
		System.out.println(s);
	}

}
