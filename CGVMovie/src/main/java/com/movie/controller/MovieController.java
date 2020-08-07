package com.movie.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.dto.CGVInfo;
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
	
	
	// 영화 예약 페이지
	@RequestMapping(value="/reserve", method=RequestMethod.GET)
	public void reserve(@RequestParam(value="movieTitle", required = false) String movieTitle, Model model) {
		log.debug("reserve");
		model.addAttribute("movieTitle", movieTitle);
		try {
			service.getReserveInfo();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="getMovie", method=RequestMethod.POST)
	public List<CGVInfo> getMovie(Model model) {
		List<CGVInfo> movieList = new ArrayList<CGVInfo>();
		
		try {
			movieList = service.getCrawlingMovie();
			model.addAttribute("movieList", movieList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return movieList;
	}
	
	
}
