package com.board.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.dto.UserDetail;
import com.board.service.AdminService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// admin home + 회원목록 가져오기
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public void adminHome(Model model) {
		try {
			List<UserDetail> memberList = service.getMemberList();
			model.addAttribute("memberList", memberList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="/memberDisEnabled", method=RequestMethod.POST)
	public void memberDisEnabled(@RequestParam(value="id", required = true) String id, @RequestParam(value="enabled") String enabled) {
		try {
			if(enabled.equals("true")) {
				enabled = "0";
			} else {
				enabled = "1";
			}
			int result = Integer.parseInt(enabled);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("enabled", result);
			service.memberDisEnabled(map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="/chart", method=RequestMethod.POST)
	public HashMap<String, Object> countEnabledAndDisEnabled() {
		HashMap<String, Object> map = null;
		try {
			int enabled = service.countDisEnabled();
			int disEnabled = service.countEnabled();
			
			System.out.println("활성화 : " + enabled);
			System.out.println("비활성화 : " + disEnabled);
			map = new HashMap<String, Object>();
			map.put("enabled", enabled);
			map.put("disEnabled", disEnabled);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	
	
	
}
