package com.remind.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.remind.board.dto.UserDto;

@Controller
public class LoginController {

	@RequestMapping(value= {"/", "/login"})
	public String login() {
		return "login";
	}
	
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
