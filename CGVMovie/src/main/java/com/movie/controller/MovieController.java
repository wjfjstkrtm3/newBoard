package com.movie.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.dto.CGVInfo;
import com.movie.dto.Guest;
import com.movie.service.MovieService;

@Controller
@RequestMapping(value="/movie")
public class MovieController {

	@Autowired
	private MovieService service;
	
	private Logger log = LoggerFactory.getLogger(MovieController.class);

	
	// 영화 크롤링 데이터
	@RequestMapping(value="/main")
	public void test(Model model) {
		log.debug("main");
		List<CGVInfo> movieList = new ArrayList<CGVInfo>();
		try {
			movieList = service.getCrawlingMovie();
			model.addAttribute("movieList", movieList);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
}
