package com.movie.service;

import java.util.List;

import com.movie.dto.Movie;

public interface MovieService {

	// 영화 크롤링
	public List<Movie> getCrawlingMovie() throws Exception;
	
	
}
