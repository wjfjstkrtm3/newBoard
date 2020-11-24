package com.remind.board.utils;

import java.util.UUID;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class Etc {
	
	// 32개의 십진수와 4개의 '-'로 된 36자리의 문자열을 리턴
	public static String getRandomString() {
		return UUID.randomUUID().toString();
	}
	
	public static String getUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		/*
		auth.getPrincipal() 함수를 통해 return 되는 것은 2가지
		1. 인증을 하지않은 상태에서 이 코드가 실행되면 anoymousUser란 문자열이 들어있는 String 객체
		2. 인증에 성공하면 우리가 로그인한 사용자 정보가 들어가있는 객체가 return된다
		principal : 시스템을 사용하려는 사용자의 정보가 저장
		*/
		Object principal = auth.getPrincipal();
		String name ="";
		if(principal != null) {
			name = auth.getName();
		}
		return name;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
