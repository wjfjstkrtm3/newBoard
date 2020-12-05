package com.remind.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/video")
public class VideoController {
	
	@GetMapping(value="/videoList")
	public String videoList() {
		return "/board/video/videoList";
	}
}
