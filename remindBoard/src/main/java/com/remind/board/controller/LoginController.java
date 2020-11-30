package com.remind.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.remind.board.dto.UserDto;

@Controller
public class LoginController {

	
	// 로그인 페이지
	@RequestMapping(value= {"/", "/login"})
	public String login() {
		return "login";
	}
	
	// 권한이 없는 페이지에 접근했을떄
	@RequestMapping(value="/access_denied_page")
	public String accessDeniedPage() {
		return "/denied/deniedPage";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public UserDto test(UserDto userDto) {
		userDto.setId("gdgdg");
		return userDto;
	}
	
}
