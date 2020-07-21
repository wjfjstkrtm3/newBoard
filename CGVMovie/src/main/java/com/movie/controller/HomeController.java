package com.movie.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/")
	public String homePage() {
		log.debug("home");
		return "login";
	}
	
}
