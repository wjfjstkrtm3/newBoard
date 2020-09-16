package com.example.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.board.dto.boardDTO;

@Service
public interface boardService {

	// 게시물 목록 조회
	public List<boardDTO> boardList() throws Exception;
	
	// 게시물 총 개수
	public int count() throws Exception;
	
	
	// 게시물 목록 + 페이징(끝이 없는 페이징)
	public List<boardDTO> listPage(Map<String, Integer> map) throws Exception;
}
