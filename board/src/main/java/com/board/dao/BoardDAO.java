package com.board.dao;

import java.util.List;

import com.board.dto.BoardVO;

public interface BoardDAO {

	//	게시물 목록
	public List<BoardVO> list() throws Exception;
	
	
}
