package com.remind.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.remind.board.dto.UserDto;
import com.remind.board.service.UserService;
import com.remind.board.service.VideoBoardService;
import com.remind.board.utils.Etc;

@Controller
@RequestMapping(value="/video")
public class VideoBoardController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private VideoBoardService service;
	
	
		// 비디오 게시판 View
		@RequestMapping(value="/videoList", method=RequestMethod.GET)
		public String videoList(Model model) {
			
			try {
				
				// user 이미지
				UserDto userDto = userService.getUserById(Etc.getUser());
				model.addAttribute("userDto", userDto);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "/board/video/videoList";
		}
		
		@RequestMapping(value="/videoList", method=RequestMethod.POST)
		public String videoList() {
			try {
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				
			}
			
			return "";
		}
	
}
