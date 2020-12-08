package com.remind.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.remind.board.dto.BoardType;
import com.remind.board.dto.MakeBoardDto;
import com.remind.board.dto.UserDto;

@Service
public interface AdminService {

	// 관리자 페이지에서 게시물 타입(제목)등록
	public void makeBoard(String type) throws Exception;
	
	// 해당 admin계정이 들고있는 게시물 제목 가져오기
	public List<BoardType> getBoardTitleList() throws Exception;
	
	// 게시판 지우기 
	public int boardDelete(String type) throws Exception;
	
	// 게시판 이름 누르면 해당 게시판에 맞는 List 가져오기
	public List<MakeBoardDto> getBoardListById(int id) throws Exception;
		
	// 게시물 작성 
	public void boardWrite(MakeBoardDto makeBoardDto) throws Exception;
	
	// 게시판 Id로 게시판 이름 찾기
	public BoardType getBoardTitleById(int id) throws Exception;

	// 게시물 수 조회
	public int boardCount(int id) throws Exception;
	
	// user 조회
	public List<UserDto> selectUsers() throws Exception;
	
	// user 수
	public int userCount() throws Exception;
	
	// 멤버관리 (활성화/비활성화)Update
	public int selectMemberUpdate(String id) throws Exception;
}
