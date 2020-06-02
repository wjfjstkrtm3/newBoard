package com.board.dao;

import java.util.List;

import com.board.dto.BoardVO;

public interface BoardDAO {

	//	게시물 목록
	public List<BoardVO> list() throws Exception;
	
	// 게시물 쓰기
	public void write(BoardVO vo) throws Exception;
	
	// 게시물 조회
	public BoardVO listOne(int bno) throws Exception;
	
	// 게시물 수정
	public void BoardUpdate(BoardVO vo) throws Exception;
	
	// 게시물 삭제
	public void BoardDelete(int bno) throws Exception;
	
	// 게시물 총 개수
	public int BoardCount() throws Exception;
	
	// 게시물 목록 + 페이징
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception;
	
	// 게시물 목록 + 페이징 + 검색
	 public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;
	 
	 
}
