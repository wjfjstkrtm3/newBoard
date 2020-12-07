package com.remind.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remind.board.dao.AdminDao;
import com.remind.board.dto.BoardType;
import com.remind.board.dto.MakeBoardDto;
import com.remind.board.dto.UserDto;

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

	// 게시판 이름 누르면 해당 게시판에 맞는 List 가져오기
	@Override
	public List<MakeBoardDto> getBoardListById(int id) throws Exception {
		return dao.getBoardListById(id);
	}
	
	// 게시물 작성
	@Override
	public void boardWrite(MakeBoardDto makeBoardDto) throws Exception {
			dao.boardWrite(makeBoardDto);
	}

	// 게시판 Id로 게시판 이름 찾기
	@Override
	public BoardType getBoardTitleById(int id) throws Exception {
		return dao.getBoardTitleById(id);
	}

	// 게시물 수 조회
	@Override
	public int boardCount(int id) throws Exception {
		return dao.boardCount(id);
	}

	// user 조회
	@Override
	public List<UserDto> selectUsers() throws Exception {
		return dao.selectUsers();
	}
	
	
	
	
	
	
}
