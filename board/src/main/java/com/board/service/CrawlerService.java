package com.board.service;

import java.util.HashMap;
import java.util.List;

import com.board.dto.MovieVO;

public interface CrawlerService {

	// 뉴스 크롤링
	public List<HashMap<String,String>> getNews() throws Exception;
	
	// 영화 크롤링
	public List<MovieVO> getMovie() throws Exception; 
}
