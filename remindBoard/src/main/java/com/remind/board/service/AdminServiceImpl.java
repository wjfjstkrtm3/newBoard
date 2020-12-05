package com.remind.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remind.board.dao.AdminDao;
import com.remind.board.dto.BoardType;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;

	// 관리자 페이지에서 게시물 타입(제목)등록
	@Override
	public void makeBoard(String type) throws Exception {
		dao.makeBoard(type);
	}

	// 해당 admin계정이 들고있는 게시물 제목 가져오기
	@Override
	public List<BoardType> getBoardTitleList() throws Exception {
		return dao.getBoardTitleList();
	}

	// 게시판 지우기 
	@Override
	public int boardDelete(String type) throws Exception {
		return dao.boardDelete(type);
	}
	
	
	
	
	
}
