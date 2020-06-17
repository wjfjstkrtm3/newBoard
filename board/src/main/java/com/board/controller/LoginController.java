package com.board.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.service.NewsAPI;

@Controller
public class LoginController {
	
	
	@RequestMapping(value= {"/", "/login/loginPage"})
	public String login() {
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
	
	@ResponseBody
	@RequestMapping(value="/login/news", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String getNews() {
		NewsAPI newsAPI = new NewsAPI();
		String result = newsAPI.getNews();
		return result;
		
	}


}
