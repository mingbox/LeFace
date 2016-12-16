package com.le.leface.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.le.leface.models.User;
import com.le.leface.service.FaceDetectService;
import com.le.leface.service.SpeechRecognitionService;
import com.le.leface.service.UserService;
import com.le.leface.service.WatcherStateChangeHandler;


@Controller
public class HomeController {
	
	//private static final String IMG_PATH = "/Users/mingboxu/";

	private static final String IMG = "img";

	@Autowired
	UserService userService;
	
	@Autowired
	FaceDetectService faceDetectService;
	
	@Autowired
	SpeechRecognitionService speechRecognitionService;
	
	@Autowired
    private WatcherStateChangeHandler watcherStateChangeHandler;
	
	@RequestMapping(value = "/")
	public String index(Model model) {
		return "index";
	}
	
	@RequestMapping(value = "/camera")
	public String showCamera(Model model) {
		return "showCamera";
	}
	@RequestMapping(value = "/audioTest")
	public String audioTest(Model model) {
		return "audioTest";
	}

	@RequestMapping(value = "/speechRecognition")
	public String speechRecognition(Model model, String wavFilePath) {
		String text = speechRecognitionService.speechFileToText(wavFilePath);
		model.addAttribute("speechText", text);
		return "audioTest";
	}
	
	@ResponseBody
	@RequestMapping(value = "/audioFile", method = RequestMethod.GET)
	public void audioFileGet(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "fileName", required = true) String fileName) throws IOException {
		InputStream fileStream = null;
		try {
		  response.addHeader("Cache-Control","no-cache");
	      fileStream = new FileInputStream(new File("/Users/mingboxu/workspace/LeFace/src/main/webapp/"+fileName+".wav"));
	      org.apache.commons.io.IOUtils.copy(fileStream, response.getOutputStream());
	      response.flushBuffer();
	    } catch (IOException ex) {
	      //log.info("Error writing file to output stream. Filename was '{}'", fileName, ex);
	      throw new RuntimeException("IOError writing file to output stream");
	    } finally {
	    	fileStream.close();
	    }
//		String dataDirectory = request.getServletContext().getRealPath("/");
//        Path file = Paths.get(dataDirectory, "aa.wav");
//        if (Files.exists(file)) 
//        {
//            response.setContentType("audio/x-wav");
//            response.addHeader("Content-Disposition", "attachment; filename=aa.wav");
//            response.addHeader("Cache-Control","no-cache");
//            try
//            {
//                Files.copy(file, response.getOutputStream());
//                response.getOutputStream().flush();
//            } 
//            catch (IOException ex) {
//                ex.printStackTrace();
//            }
//        }
	}
	
	@ResponseBody
	@RequestMapping(value = "/identify", method = RequestMethod.POST)
	public String identify(@RequestParam(value = IMG, required = true) String image) {
		byte[] imgByte = this.convertImg(image);
		String names = faceDetectService.identify(imgByte);
		return watcherStateChangeHandler.generateResponse(names);
	}

	@RequestMapping(value = "/detect", method = RequestMethod.POST)
	public String detect(@RequestParam(value = IMG, required = true) String imagesStr, @RequestParam String name) {
		List<byte[]> imageList = new ArrayList<byte[]>();
		
		int startIndex = 0;
		for(int i = 0; i < imagesStr.length(); i++){
			if (imagesStr.charAt(i) == '|'){
				String picture = imagesStr.substring(startIndex,i);
				byte[] imgByte = this.convertImg(picture);
				imageList.add(imgByte);
				startIndex = i+1;
			}
		}
		String personId=faceDetectService.detect(name, imageList);
		if(personId!=null){
			userService.addUser(new User(personId,name));
		}
		return "redirect:/";
	}
	
	private byte[] convertImg(String img) {
		byte[] data = Base64.decodeBase64(img.substring(img.indexOf(",")+1));
		return data;
	}

	@RequestMapping(value ="/admin", method = RequestMethod.GET)
	public String admin(Model model) {
		JSONObject result=faceDetectService.getPersonList();
		List<User> persons=new ArrayList<User>();
		try {
			JSONArray personList;
			personList = result.getJSONArray("person");
			User user;
			for(int i=0;i<personList.length();i++){
				JSONObject person=personList.getJSONObject(i);
				user=new User(person.getString("person_id"),person.getString("person_name"),person.getString("tag"));
				persons.add(user);
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		model.addAttribute("persons", persons);
		return "admin/index";
	}
	@RequestMapping(value ="/remove/{personId}", method = RequestMethod.GET)
	public String removeByPersonId(@PathVariable String personId) {
		faceDetectService.removePerson(personId);
		return "redirect:/admin";
	}
	
	@RequestMapping(value ="/removeall", method = RequestMethod.GET)
	public String removeAll() {
		faceDetectService.removeAllPersons();
		return "redirect:/admin";
	}
}
