package com.remind.board.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.remind.board.dto.BoardType;
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
	public String makeBoard(Model model, HttpSession session) {
		String type = "";
		List<BoardType> list = new ArrayList<BoardType>();
		try {
			
			
			// user 이미지
			UserDto userDto = userService.getUserById(Etc.getUser());
			model.addAttribute("userDto", userDto);
			
			// 게시판 이름
			list = service.getBoardTitleList();
			model.addAttribute("boardTitle", list);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/admin/makeBoard";
		
	}
	
	@RequestMapping(value="/makeBoardWrite")
	public String makeBoard(Model model, @RequestParam(value="dataArray", defaultValue = "") String dataArray[],
										 @RequestParam(value="deleteArray", defaultValue = "") String deleteArray[]) {
		String type = "";
		int result = 0;
		
		try {
			UserDto userDto = userService.getUserById(Etc.getUser());
			model.addAttribute("userDto", userDto);
		
			
			// '-'버튼에 있는 게시판 삭제하기
			if(deleteArray.length > 0) {
				for(int i = 0; i < deleteArray.length; i++) {
								
					type = deleteArray[i];
					result = service.boardDelete(type);
				}
			}
						
			
			
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
		
		return "redirect:/admin/makeBoard";
		
	}
	
	
	
	
	@ResponseBody
	@PostMapping(value="/getBoardTitleList")
	public List<BoardType> getBoardTitleList(Model model) {
		List<BoardType> list = new ArrayList<BoardType>();
		try {
			list = service.getBoardTitleList();
			model.addAttribute("boardTitle", list);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	

	
}
