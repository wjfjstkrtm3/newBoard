package com.board.utils;

import java.util.UUID;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class CommonUtils {

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
		
	
	
	public static String getUserName() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		
		String name = "";
		if(principal != null) {
			name = auth.getName();
		}
		return name;
	}
}
