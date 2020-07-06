package com.board.service;

import java.util.HashMap;
import java.util.List;

public interface CrawlerService {

	// 뉴스 크롤링
	public List<HashMap<String,String>> getNews() throws Exception;
}
