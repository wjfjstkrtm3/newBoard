package com.example.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.board.dao.boardDAO;
import com.example.board.dto.boardDTO;

@Service
public class boardServiceImpl implements boardService {

	@Autowired
	private boardDAO dao;
	
	
	// 게시물 목록 조회
	@Override
	public List<boardDTO> boardList() throws Exception  {
		return dao.boardList();
	}


	// 게시물 총 개수
	@Override
	public int count() throws Exception {
		return dao.count();
	}

	// 게시물 목록 + 페이징(끝이 없는 페이징)
	@Override
	public List<boardDTO> listPage(Map<String, Integer> map) throws Exception {
		return dao.listPage(map);
	}

	
	
	
	
}
