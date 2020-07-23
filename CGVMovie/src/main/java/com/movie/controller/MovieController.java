package com.movie.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.service.MovieService;

@Controller
@RequestMapping(value="/movie")
public class MovieController {

	@Autowired
	private MovieService service;
	
	private Logger log = LoggerFactory.getLogger(MovieController.class);
	
	@RequestMapping(value="/main")
	public void test() {
		log.debug("main");
	}
	
	
	
	
}
