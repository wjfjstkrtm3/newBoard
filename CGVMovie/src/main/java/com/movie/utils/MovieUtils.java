package com.movie.utils;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.movie.dto.Guest;

public class MovieUtils {

	public static String getUserName() {
		String username = "";
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		
		// 여기서 principal 은
		// 인증을 하지않은상태에서 해당 코드가 실행이되면 anonymousUser란 문자열이 있는 String이 return 되거나
		// 인증에 성공한상태에서 해당 코드가 실행이되면 해당 user 정보를 담고있는 객체가 return 이 된다
		if(principal != null && principal instanceof Guest) { // null이 아니고, Guest객체일 경우에 정보를 가져온다
			username = auth.getName();
		}
		return username;
	}
	
	
}
