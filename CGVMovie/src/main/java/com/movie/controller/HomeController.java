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
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.dto.CGVInfo;
import com.movie.service.MovieService;

@Controller
public class HomeController {
	
	@Autowired
	private MovieService service;
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value= "/")
	public String homePage(Model model) {
		log.debug("home");
		
		return "login";
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
