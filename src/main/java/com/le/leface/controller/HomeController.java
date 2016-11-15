package com.le.leface.controller;

import java.io.IOException;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String image(Locale locale, Model model) throws IOException{
		
		User user = userService.getUserById(1L);
		System.out.println(user.getFirstName() + " " + user.getLastName());
		return "index";
	}
	
	@RequestMapping(value = "/identify")
	public User identify(byte[] img) throws IOException{
		String personId=faceDetectService.identify(img);
		if(personId!=null){
			User user = userService.getUserByFaceId(personId);
			System.out.println(user.getFirstName());
			return user;
		}
		return null;
	}

	@RequestMapping(value = "/detect")
	public void detect(String name,byte[] img) throws IOException{
		faceDetectService.detect(name, img);
	}
}
