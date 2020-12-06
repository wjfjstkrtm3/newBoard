package com.remind.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.remind.board.dto.BoardType;
import com.remind.board.dto.MakeBoardDto;

@Service
public interface AdminService {

	// 관리자 페이지에서 게시물 타입(제목)등록
	public void makeBoard(String type) throws Exception;
	
	// 해당 admin계정이 들고있는 게시물 제목 가져오기
	public List<BoardType> getBoardTitleList() throws Exception;
	
	// 게시판 지우기 
	public int boardDelete(String type) throws Exception;
	
	// 게시판 이름 누르면 해당 게시판에 맞는 List 가져오기
	public List<MakeBoardDto> list(int id) throws Exception;
		
	// 게시물 작성 
	public void boardWrite(MakeBoardDto makeBoardDto) throws Exception;

}
