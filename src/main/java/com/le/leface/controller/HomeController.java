package com.le.leface.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

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
	
	@ResponseBody
	@RequestMapping(value = "identify", method = RequestMethod.POST)
	public User identify(HttpServletRequest req) throws IOException{
		MultipartFile file = ((DefaultMultipartHttpServletRequest) req).getFile("img");
		String personId=faceDetectService.identify(file.getBytes());
		if(personId!=null){
			User user = userService.getUserByFaceId(personId);
			System.out.println(user.getFirstName());
			return user;
		}
		return null;
	}

	@ResponseBody
	@RequestMapping(value = "detect", method = RequestMethod.POST)
	public void detect(HttpServletRequest req) throws IOException{
		MultipartFile file = ((DefaultMultipartHttpServletRequest) req).getFile("img");
		faceDetectService.detect(req.getParameter("name"), file.getBytes());
	}
}
