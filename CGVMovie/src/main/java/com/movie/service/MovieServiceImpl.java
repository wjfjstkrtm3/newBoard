package com.movie.service;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;

import com.movie.dto.Movie;

@Service
public class MovieServiceImpl implements MovieService {

	
	// 영화 크롤링
	@Override
	public List<Movie> getCrawlingMovie() {
		try {
			Document doc = Jsoup.connect("http://www.cgv.co.kr/movies/").get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

}
