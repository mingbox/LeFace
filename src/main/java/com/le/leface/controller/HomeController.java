package com.le.leface.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.le.leface.service.UserService;


@Controller
public class HomeController {
	
	//private static final String IMG_PATH = "/Users/mingboxu/";

	private static final String IMG = "img";

	@Autowired
	UserService userService;
	
	@Autowired
	FaceDetectService faceDetectService;
	
	@RequestMapping(value = "/")
	public String index(Model model) {
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value = "/identify", method = RequestMethod.POST)
	public String identify(@RequestParam(value = IMG, required = true) String image) {

		byte[] imgByte = this.convertImg(image);
		String personId=faceDetectService.identify(imgByte);
		if(personId!=null){
			User user = userService.getUserByFaceId(personId);
			//System.out.println(user.getFirstName());
			return user.getFirstName()+" "+user.getLastName();
		}
		
		return "";
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
