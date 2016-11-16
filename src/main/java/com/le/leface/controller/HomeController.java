package com.le.leface.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.le.leface.models.User;
import com.le.leface.service.FaceDetectService;
import com.le.leface.service.UserService;


@Controller
public class HomeController {
	
	private static final String IMG_PATH = "/Users/mingboxu/tmp.jpg";
	private static final String IMG = "img";

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
	public String identify(@RequestParam(value = IMG, required = true) String image) {

		byte[] imgByte = this.convertImg(image);
		String personId=faceDetectService.identify(imgByte);
		if(personId!=null){
			User user = userService.getUserByFaceId(personId);
			System.out.println(user.getFirstName());
			return user.getFirstName()+" "+user.getLastName();
		}
		
		return "";
	}

	@RequestMapping(value = "/detect", method = RequestMethod.POST)
	public String detect(@RequestParam(value = IMG, required = true) String image, @RequestParam String name) {

		byte[] imgByte = this.convertImg(image);
		String personId=faceDetectService.detect(name, imgByte);
		if(personId!=null){
			userService.addUser(new User(personId,name));
		}
		
		return "index";
	}
	
	private byte[] convertImg(String img) {
		byte[] data = Base64.decodeBase64(img.substring(img.indexOf(",")+1));
//		try (OutputStream stream = new FileOutputStream(IMG_PATH)) {
//		    stream.write(data);
//		}
//		File imgPath = new File(IMG_PATH);
//		BufferedImage bufferedImage = ImageIO.read(imgPath);
//		WritableRaster raster = bufferedImage.getRaster();
//		DataBufferByte binaryImage = (DataBufferByte) raster.getDataBuffer();
		return data;
	}

}
