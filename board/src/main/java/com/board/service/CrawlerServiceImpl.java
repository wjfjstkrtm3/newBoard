package com.board.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

@Service
public class CrawlerServiceImpl implements CrawlerService{

	
	
	// 뉴스 크롤링
	@Override
	public List<HashMap<String,String>> getNews() throws Exception{
		
		List<HashMap<String,String>> addNews = new ArrayList<HashMap<String,String>>();
		HashMap<String, String> politics = returnNews(0);
		HashMap<String, String> economy = returnNews(1);
		HashMap<String, String> social = returnNews(2);
		HashMap<String, String> life = returnNews(3);
		HashMap<String, String> world = returnNews(4);
		HashMap<String, String> it = returnNews(5);
		
		addNews.add(politics);
		addNews.add(economy);
		addNews.add(social);
		addNews.add(life);
		addNews.add(world);
		addNews.add(it);
		return addNews;
	}

	// 뉴스 담아주는 함수
	public HashMap<String,String> returnNews(int num) throws IOException {
		// 가져온 데이터를 document형태로 반환
		HashMap<String,String> newsMap = new HashMap<String, String>();
		String newsTitle = "";
		String newsUrl = "";
		
	
		Document doc = Jsoup.connect("http://news.naver.com/").get();
		Element newsParent = doc.select("ul.mlist2").get(num);
		Elements news = newsParent.select("li");
		System.out.println(news.toString());
		for(Element e : news) {
			newsTitle = e.text();
			newsUrl = e.getElementsByAttribute("href").attr("href");
			newsMap.put(newsTitle, newsUrl);
		}
		
		return newsMap;
	}
	
}
