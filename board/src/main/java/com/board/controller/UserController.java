package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.dto.UserDetail;
import com.board.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Autowired
	private UserService service;
	
	@RequestMapping(value="/userSignUp", method=RequestMethod.GET)
	public void UserSignUp() {
		
	}
	
	@RequestMapping(value="/userSignUp", method=RequestMethod.POST)
	public String UserSignUp(UserDetail vo) {
		try {
			service.userSignUp(vo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
		
	}
	
}
