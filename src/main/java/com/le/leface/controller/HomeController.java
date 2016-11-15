package com.le.leface.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.le.leface.models.User;
import com.le.leface.service.FaceDetectService;
import com.le.leface.service.UserService;

@Controller
public class HomeController {

	@Autowired
	UserService userService;
	
	@Autowired
	FaceDetectService faceDetectService;
	
	@RequestMapping(value = "/")
	public String index(Model model) {
		
		User user = userService.getUserById(1L);
		System.out.println(user.getFirstName() + " " + user.getLastName());
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value = "/identify", method = RequestMethod.POST)
	public User identify(@RequestParam(value = "img", required = true) CommonsMultipartFile file) throws IOException{
		String personId=faceDetectService.identify(file.getBytes());
		if(personId!=null){
			User user = userService.getUserByFaceId(personId);
			System.out.println(user.getFirstName());
			return user;
		}
		return null;
	}

	@ResponseBody
	@RequestMapping(value = "/detect", method = RequestMethod.POST)
	public String detect(@RequestParam(value = "img", required = true) CommonsMultipartFile file,@RequestParam String name) throws IOException{
		String personId=faceDetectService.detect(name, file.getBytes());
		if(personId!=null){
			userService.addUser(new User(personId,name));
		}
		return personId;
	}

}
