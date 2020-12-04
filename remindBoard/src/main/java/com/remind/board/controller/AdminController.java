package com.remind.board.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.remind.board.dto.UserDto;
import com.remind.board.service.AdminService;
import com.remind.board.service.UserService;
import com.remind.board.utils.Etc;

@Controller
@RequestMapping(value="/admin")
public class AdminController {

	private UserService userService;

	@Autowired
	private AdminService service;
	
	@Autowired
	private void setUserService(UserService userService) {
		this.userService = userService;
	}

	
	@GetMapping(value="/makeBoard")
	public String makeBoard(Model model, @RequestParam(value="dataArray", defaultValue = "") String dataArray[]) {
		Map<String, Object> map = new HashMap<String, Object>();
		String type = "";
		try {
			UserDto userDto = userService.getUserById(Etc.getUser());
			model.addAttribute("userDto", userDto);
		
			// mybatis에서 해결하지말고
			// dataArray의 length만큼 돌려서 담는 방법
			// 게시물의 제목을 담음 (게시물의 제목이 여러개 날라올 수 있으니까)
			for(int i = 0; i < dataArray.length; i++) {
				type = dataArray[i];
				service.makeBoard(type);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/admin/makeBoard";
		
	}
	

	
}
