package com.movie.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/movie")
public class MovieController {

	private Logger log = LoggerFactory.getLogger(MovieController.class);
	
	@RequestMapping(value="/test")
	public String test() {
		log.debug("test");
		return "test";
		
	}
}
