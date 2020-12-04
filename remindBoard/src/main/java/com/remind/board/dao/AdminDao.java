package com.remind.board.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface AdminDao {
	
	// 관리자 페이지에서 게시물 타입(제목)등록
	public void makeBoard(String type) throws Exception;
	
}
