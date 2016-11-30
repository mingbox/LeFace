package com.le.leface.service.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.le.leface.service.WatcherStateChangeHandler;

@Service
public class WatcherStateChangeHandlerImpl implements WatcherStateChangeHandler{
	
	@Autowired
    private ServletContext servletContext;
	
	private static final Map<String, String> messageMap;
	static {
		messageMap = new HashMap<String, String>();
		messageMap.put("mingbo", "Westworld");
		messageMap.put("heng jiang", "Warrior vs Spurs");
		messageMap.put("Chen Xu", "Game of throne");
		messageMap.put("Scott", "Narcos");
		messageMap.put("james", "CNN");
		messageMap.put("Cedric", "49ers vs New England Patriots");
    }

	@Override
	public String generateResponse(String names) {
		
		if (names.isEmpty()) {
			return "";
		} else {
			return this.updateStateAndGenerateMessage(names);
		}
	}

	private String updateStateAndGenerateMessage(String names) {
		String message = "";
		@SuppressWarnings("unchecked")
		Set<String> nameSetCurrent = (Set<String>) servletContext.getAttribute("nameSetCurrent");
		Set<String> nameSetNew = new HashSet<String>();
		String[] nameArr = names.split(",");
		for (int i = 0; i < nameArr.length; i++){
			nameSetNew.add(nameArr[i]);
		}
		
		if(nameSetCurrent == null) nameSetCurrent = new HashSet<String>(); //prevent NPE
		
		for (String s : nameSetCurrent){
			if(!nameSetNew.contains(s)){
				message += "Goodbye "+s+"! ";
			}
		}
		for (String s : nameSetNew){
			if(!nameSetCurrent.contains(s)){
				message += "Hello "+s+"! Would you like to watch "+messageMap.get(s)+"? ";
			}
		}
		
//		System.out.println("old: "+nameSetCurrent);
//		System.out.println("new: "+nameSetNew);
		servletContext.setAttribute("nameSetCurrent",nameSetNew);
		return message;
	}
	
	
}
