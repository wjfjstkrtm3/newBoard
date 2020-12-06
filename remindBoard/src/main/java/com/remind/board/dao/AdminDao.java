package com.remind.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.remind.board.dto.BoardType;

@Repository
public interface AdminDao {
	
	// 관리자 페이지에서 게시물 타입(제목)등록
	public void makeBoard(String type) throws Exception;
	
	// 해당 admin계정이 들고있는 게시물 제목 가져오기
	public List<BoardType> getBoardTitleList() throws Exception;
	
	// 게시판 지우기 
	public int boardDelete(String type) throws Exception;
	
		
	
}
