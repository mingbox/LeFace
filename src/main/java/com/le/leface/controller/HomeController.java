package com.le.leface.controller;

import java.io.IOException;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.le.leface.models.User;
import com.le.leface.service.UserService;

@Controller
public class HomeController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/")
	public String image(Locale locale, Model model) throws IOException{
		
		User user = userService.getUserById(1L);
		System.out.println(user.getFirstName() + " " + user.getLastName());
		return "index";
	}
	

}
