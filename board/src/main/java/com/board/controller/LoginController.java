package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@RequestMapping(value="/loginPage")
	public String loginPage() {
		return "login";
	}
	
	@RequestMapping(value="/home")
	public String home() {
		return "home";
	}
	
}
