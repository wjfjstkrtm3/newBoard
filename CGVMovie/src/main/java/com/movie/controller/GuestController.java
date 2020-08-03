package com.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.dto.Guest;
import com.movie.service.GuestService;

@Controller
@RequestMapping(value="/guest")
public class GuestController {
	
	@Autowired
	private GuestService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// 로그인 에러
	@GetMapping("/login-error")
	  public String loginFailed(Model model) {
	    model.addAttribute("error", true);
	    return "/login";
	  }
	
	// 회원가입 페이지 
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public void guestSignUp() {
		
	}
	
	// 회원가입 처리
	@ResponseBody
	@RequestMapping(value="/signUpProcess", method=RequestMethod.POST)
	public void guestSignUp(@RequestBody Guest guest) {
		String password = guest.getPassword();
		guest.setPassword(bCryptPasswordEncoder.encode(password));
		
		try {
			service.guestSignUp(guest);
		}catch(Exception e) {
			
		}
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public int idCheck(@RequestParam(value="userId") String id) {
		System.out.println("id : " + id);
		int result = 0;
		try {
			result = service.guestIdCheck(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return result;
	}
	
	
}
