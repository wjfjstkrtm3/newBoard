package com.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.dto.Guest;
import com.movie.service.GuestService;

@Controller
@RequestMapping(value="/guest")
public class GuestController {
	
	@Autowired
	private GuestService service;
	
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
		
		return "/movie/test";
		
	}
	
}
