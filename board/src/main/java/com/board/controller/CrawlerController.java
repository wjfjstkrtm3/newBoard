package com.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.service.CrawlerService;

@Controller
@RequestMapping(value="/crawler")
public class CrawlerController {

	
	@Autowired
	private CrawlerService service;
	
	@RequestMapping(value="/news", method=RequestMethod.GET)
	public void getNews(Model model) {
		List<HashMap<String, String>> getNews = new ArrayList<HashMap<String,String>>();
		try {
			getNews = service.getNews();
			model.addAttribute("newsMap", getNews);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
