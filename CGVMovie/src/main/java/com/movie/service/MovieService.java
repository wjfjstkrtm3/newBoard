package com.movie.service;

import java.util.List;

import com.movie.dto.CGVInfo;

public interface MovieService {

	// 영화 크롤링
	public List<CGVInfo> getCrawlingMovie() throws Exception;
	
	// 영화 예약 크롤링
	public List<String> getReserveInfo() throws Exception; 
	
	
}
