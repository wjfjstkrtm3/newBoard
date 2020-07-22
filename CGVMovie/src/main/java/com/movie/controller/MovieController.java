package com.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.dto.CGVInfo;
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
	
	@ResponseBody
	@RequestMapping(value="/movieImg", method=RequestMethod.POST)
	public List<CGVInfo> getMovieImg() {
		List<CGVInfo> list = new ArrayList<CGVInfo>();
		try {
			list = service.getCrawlingMovie();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}
