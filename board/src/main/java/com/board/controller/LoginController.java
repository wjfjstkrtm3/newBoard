package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.service.newsAPI;

@Controller
public class LoginController {
	
	
	@RequestMapping(value= {"/", "/login/loginPage"})
	public String login() {
		newsAPI newsAPI = new newsAPI();
		System.out.println(newsAPI.getNews());
		return "login";
	}
	
	@RequestMapping(value="/login/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value="/access_denied_page")
	public String deniedPage() {
		return "deniedPage";
	}
	
	
	
}
