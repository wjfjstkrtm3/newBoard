package com.board.service;

import java.util.List;

import com.board.dto.BoardVO;

public interface BoardService {

	//	게시물 목록
	public List<BoardVO> list() throws Exception;
	
}
