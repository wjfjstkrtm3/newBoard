package com.remind.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/video")
public class VideoBoardController {

	// 비디오 게시판 View
		@RequestMapping(value="/videoList", method=RequestMethod.GET)
		public String videoList() {
			return "/board/video/videoList";
		}
		
		@RequestMapping(value="/videoList", method=RequestMethod.POST)
		public String videoList(Model model) {
			try {
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				
			}
			
			return "";
		}
	
}
