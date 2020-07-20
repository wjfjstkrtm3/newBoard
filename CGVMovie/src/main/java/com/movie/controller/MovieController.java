package com.movie.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieController {

	private Logger log = LoggerFactory.getLogger(MovieController.class);
	@RequestMapping(value="/")
	public String homePage() {
		log.debug("home debug");
		return "login";
	}
	
	@RequestMapping(value="/test10")
	public String test() {
		log.debug("test10 debug");
		return "test";
		
	}
}
