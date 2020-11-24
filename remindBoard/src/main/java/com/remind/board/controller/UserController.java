package com.remind.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.remind.board.dto.UserDto;
import com.remind.board.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private UserService service;
	
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String signUp() {
		return "/user/signUp";
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String signUp(UserDto userDto, MultipartHttpServletRequest request) {
		
		MultipartFile multipartFile = null;
		
		
		try {
			multipartFile = request.getFile("file01");
			userDto.setImage(multipartFile.getOriginalFilename());
			service.userSignUp(userDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// db에 id칼럼 추가하고
		
		
		
		System.out.println(multipartFile.getOriginalFilename());
		
		System.out.println("미쳣냐?");
		return "/login";
	}
	
}
