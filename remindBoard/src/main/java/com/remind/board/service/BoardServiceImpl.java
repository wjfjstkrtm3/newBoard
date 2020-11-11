package com.remind.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remind.board.dao.BoardDao;
import com.remind.board.dto.BoardDto;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	// 게시물 목록
	@Override
	public List<BoardDto> list() throws Exception {
		return dao.list();
	}

	// 총 게시물 수
	@Override
	public int count() throws Exception {
		return dao.count();
	}

	// 게시물 목록 + 페이징
	@Override
	public List<BoardDto> listPage(Map<String, Integer> map) throws Exception {
		return dao.listPage(map);
	}

	

	
}
