package com.board.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Service;

public class NewsAPI {
	
	 public String getNews() {
		    // API 접속을 위한 ID와 비밀번호
		    String clientId = "SChySwLqZVBLocgdI4Qh";
		    String clientSecret = "tO7fMgcFEd";
		    final int DISPLAY = 15; // 뉴스를 가져올 숫자(최대 100개)
		    
		    // 뉴스 결과를 담을 StringBuffer
		    StringBuffer resp = new StringBuffer();
		    try {
		      // 뉴스 검색어를 UTF-8 인코딩으로 전환, 검색어에 제공
		      String text = URLEncoder.encode("코로나", "UTF-8");
		      // API에 요청
		      String apiURL = "https://openapi.naver.com/v1/search/news.json?sort=date&query=" + text + "&display=" + DISPLAY;
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection) url.openConnection();
		      con.setRequestMethod("GET");
		      con.setRequestProperty("X-Naver-Client-Id", clientId);
		      con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      if (responseCode == 200) {
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      while ((inputLine = br.readLine()) != null) {
		        resp.append(inputLine);
		      }
		      br.close();
		    } catch (UnsupportedEncodingException e) {
		    } catch (MalformedURLException e) {
		    } catch (IOException e) {
		    }
		    System.out.println(resp.toString());
		    return resp.toString();
		  }
}
