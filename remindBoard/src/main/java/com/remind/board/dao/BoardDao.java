package com.remind.board.dao;

import java.util.List;
import java.util.Map;

import com.remind.board.dto.BoardDto;

public interface BoardDao {

	// 게시물 목록
	public List<BoardDto> list() throws Exception;
	
	// 총 게시물 수
	public int count() throws Exception;
	
	// 게시물 목록 + 페이징
	public List<BoardDto> listPage(Map<String, Integer> map) throws Exception;
}
