package com.le.leface.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.ByteArrayBody;
import org.apache.http.entity.mime.content.StringBody;
import org.json.JSONArray;
import org.json.JSONObject;

import com.facepp.error.FaceppParseException;
import com.le.leface.service.FaceDetectService;

public class FaceDetectServiceFacePPv3Impl implements FaceDetectService {
	
	private static final String apiKey = "RQPRHXEyuhTL2P27IcaG4rd6Gix4IL7D";
	private static final String apiSecret = "UwkIy0qeix_FbD5rNx1iX4orDrYKoLIw";
	private static final String facesetToken = "41da340efc9df7cb65eb22fbbb4b3c11";
	private static final String endpoint = "https://api-cn.faceplusplus.com/facepp/v3/";
	private final static int boundaryLength = 32;
	private final static String boundaryAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_";
	private String boundary = null;

	
	String getBaseUrl(String control, String action) {
		if (control == null || control.isEmpty()) {
			return endpoint + action;
		}
		return endpoint + control + "/" + action;
	}
	
	public FaceDetectServiceFacePPv3Impl() {
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < boundaryLength; ++i)
			sb.append(boundaryAlphabet.charAt(random.nextInt(boundaryAlphabet.length())));
		boundary = sb.toString();
	}
	
	private JSONObject request(String control, String action, MultipartEntity reqEntity) {
		URL url;
		HttpURLConnection urlConn = null;
		JSONObject result = null;
		try {
			url = new URL(getBaseUrl(control, action));
			urlConn = (HttpURLConnection) url.openConnection();
	        urlConn.setRequestMethod("POST");
	        urlConn.setConnectTimeout(30000);
	        urlConn.setReadTimeout(30000);
	        urlConn.setDoOutput(true);

	        urlConn.setRequestProperty("connection", "keep-alive");
	        urlConn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
	        
			reqEntity.addPart("api_key", new StringBody(apiKey));
	        reqEntity.addPart("api_secret", new StringBody(apiSecret));
            reqEntity.writeTo(urlConn.getOutputStream());
            
            String resultString = null;
            if (urlConn.getResponseCode() == 200)
            	resultString = readString(urlConn.getInputStream());
            else
            	resultString = readString(urlConn.getErrorStream());
	        
            result = new JSONObject(resultString);
            
            if (result.has("error")) {
            	throw new FaceppParseException("API error.", result.getInt("error_code"),
            			result.getString("error"), urlConn.getResponseCode());
            }
            result.put("response_code", urlConn.getResponseCode());
            urlConn.getInputStream().close();
            System.out.println(result.toString(2));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	@Override
	public String identify(byte[] img) {
		StringBuffer sb = new StringBuffer();
		MultipartEntity reqEntity;
        try {
	        List<String> detected = detectFaces(img);
        	int i = 0, numDetected = detected.size();
	        for (String token : detected) {
	        	reqEntity = new MultipartEntity(HttpMultipartMode.STRICT, boundary, Charset.forName("UTF-8"));
		        reqEntity.addPart("faceset_token", new StringBody(facesetToken));
		        reqEntity.addPart("face_token", new StringBody(token));
		        reqEntity.addPart("return_result_count", new StringBody("5"));
		        JSONObject result = request("", "search", reqEntity);
		        if (result != null) {
		        	JSONArray identified = result.getJSONArray("results");
	        		if (identified.getJSONObject(0).getDouble("confidence") < 30.0) continue;
					sb.append(identified.getJSONObject(0).getString("user_id"));
					sb.append(",");
					i++;
		        }
	        }
        	for (; i < numDetected; i++) {
        		sb.append("?,");
        	}
        	sb.setLength(sb.length() - 1);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
		return sb.toString();
	}
	
	public List<String> detectFaces(byte[] img) {
		List<String> faceList = new ArrayList<String>();
		try {
			MultipartEntity reqEntity = new MultipartEntity(HttpMultipartMode.STRICT, boundary, Charset.forName("UTF-8"));
	        reqEntity.addPart("image_file", new ByteArrayBody(img, "imgfile"));
			JSONObject result = request("", "detect", reqEntity);
			if (result != null) {
				JSONArray faces = result.getJSONArray("faces");
				for (int i = 0; i < faces.length(); i++) {
					faceList.add(faces.getJSONObject(i).getString("face_token"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return faceList;
	}

	@Override
	public String detect(String name, List<byte[]> imgList) {
		ArrayList<String> faceList = new ArrayList<String>();
		MultipartEntity reqEntity;
        try {
    		for (byte[] img : imgList) {
    			List<String> result = detectFaces(img);
				if (!result.isEmpty()) {
					faceList.add(result.get(0));
				}
    		}
			StringBuffer sb = new StringBuffer(); 
    		for (int i = 0; i < faceList.size(); i++) {
    	        sb.append(faceList.get(i));
    	        sb.append(",");
    			if (i % 5 == 4 || i == faceList.size() - 1) {
        			reqEntity = new MultipartEntity(HttpMultipartMode.STRICT, boundary, Charset.forName("UTF-8"));
    				reqEntity.addPart("faceset_token", new StringBody(facesetToken));
    				sb.setLength(sb.length() - 1);
    				reqEntity.addPart("face_tokens", new StringBody(sb.toString()));
        			request("faceset", "addface", reqEntity);
        			sb.setLength(0);
    			}
    		}
    		for (String face : faceList) {
    			reqEntity = new MultipartEntity(HttpMultipartMode.STRICT, boundary, Charset.forName("UTF-8"));
				reqEntity.addPart("face_token", new StringBody(face));
				reqEntity.addPart("user_id", new StringBody(name));
    			request("face", "setuserid", reqEntity);
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public JSONObject getPersonList() {
		return null;
	}

	@Override
	public void removePerson(String personId) {
	}

	@Override
	public void removeAllPersons() {
		try {
			MultipartEntity reqEntity = new MultipartEntity(HttpMultipartMode.STRICT, boundary, Charset.forName("UTF-8"));
			reqEntity.addPart("faceset_token", new StringBody(facesetToken));
			reqEntity.addPart("face_tokens", new StringBody("RemoveAllFaceTokens"));
			request("faceset", "removeface", reqEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	
	public static void main(String[] args) {
		try {
			Path path = Paths.get("test_4154.jpg");
			byte[] data = Files.readAllBytes(path);
			FaceDetectServiceFacePPv3Impl fs = new FaceDetectServiceFacePPv3Impl();
			String s = fs.identify(data);
			System.out.println(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
