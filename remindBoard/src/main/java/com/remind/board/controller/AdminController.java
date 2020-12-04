package com.remind.board.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.remind.board.dto.UserDto;
import com.remind.board.service.UserService;
import com.remind.board.utils.Etc;

@Controller
@RequestMapping(value="/admin")
public class AdminController {

	private UserService userService;
	
	@Autowired
	private void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@GetMapping(value="/makeBoard")
	public String makeBoard(Model model) {
		try {
			UserDto userDto = userService.getUserById(Etc.getUser());
			model.addAttribute("userDto", userDto);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/admin/makeBoard";
		
	}
	
}
