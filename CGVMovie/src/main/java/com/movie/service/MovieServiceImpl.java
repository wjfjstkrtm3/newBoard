package com.movie.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.movie.dto.CGVInfo;

@Service
public class MovieServiceImpl implements MovieService {

	
	
	
	// 영화 크롤링
	@Override
	public List<CGVInfo> getCrawlingMovie() throws Exception {
		    List<CGVInfo> movieList = new ArrayList<CGVInfo>();
			Document doc = Jsoup.connect("http://www.cgv.co.kr/movies/").get();
			Elements ranks = doc.select("strong.rank"); // NO.1, NO.2, NO.3 ...
			Elements imgs = doc.select(".thumb-image > img"); // 영화 이미지 주소
			Elements titles = doc.select(".title"); // 영화 제목
			Elements percents = doc.select(".percent > span"); // 영화 예매율
			Elements evaluations = doc.select("div.egg-gage > span.percent"); // 영화 평가
			Elements openingDates = doc.select(".txt-info strong"); // 영화 개봉일
			Elements ages = doc.select(".ico-grade");
			/*
			System.out.println("rank : " + ranks.text());
			System.out.println("imgs : " + imgs.attr("src"));
			System.out.println("titles : " + titles.text());
			System.out.println("percents : " + percents.text());
			System.out.println("evaluations : " + evaluations.text());
			System.out.println("openingDates : " + openingDates.text());
			System.out.println("size : " + ranks.size());
			*/
		
			for(int i = 0; i < ranks.size(); i++) {
				String rank = ranks.get(i).text();
				
				
				String img = imgs.get(i).attr("src");
				String title = titles.get(i).text();
				String percent = percents.get(i).text();
				String evaluation = evaluations.get(i).text();
				String openingDate = openingDates.get(i).text();
				String age = ages.get(i).text();
				CGVInfo cgv = new CGVInfo(rank, img, title, percent, evaluation, openingDate, age);
				movieList.add(cgv);
			}
			
		return movieList;
	}

}
