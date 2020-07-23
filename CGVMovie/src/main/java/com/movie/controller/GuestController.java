package com.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.dto.Guest;
import com.movie.service.GuestService;

@Controller
@RequestMapping(value="/guest")
public class GuestController {
	
	@Autowired
	private GuestService service;
	
	
	// 로그인
	@RequestMapping(value="/login")
	public String guestLogin(@RequestParam(value="id") String id,
						   @RequestParam(value="password") String password,
						   Model model) {
		Guest guest = new Guest();
		guest.setId(id);
		guest.setPassword(password);
		
		int result = 0;
		try {
			result = service.guestLogin(guest);
			model.addAttribute("result", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/movie/main";
		
	}
	
	// 회원가입 페이지 
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public void guestSignUp() {
		
	}
	
	@RequestMapping(value="/signUpProcess", method=RequestMethod.POST)
	public void guestSignUp(Guest guest) {
		
	}
	
}
