package com.example.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping(value="/")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/board/main")
	public void main() {
		
	}
	
}
