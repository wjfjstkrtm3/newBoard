package com.remind.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.remind.board.dto.BoardDto;

@Repository
public interface BoardDao {

	// 게시물 목록
	public List<BoardDto> list() throws Exception;
	
	// 총 게시물 수
	public int count() throws Exception;
	
	// 게시물 총 개수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;
	
	// 게시물 목록 + 페이징
	public List<BoardDto> listPage(Map<String, Integer> map) throws Exception;
	
	// 게시물 목록 + 페이징 + 검색
	public List<BoardDto> listPageSearch(Map<String, Object> map) throws Exception;
	
	// 게시물 조회
	public BoardDto boardDetail(int bno) throws Exception;
		
	// 게시물 생성
	public int boardWrite(BoardDto boardDto) throws Exception;	
		
	// 게시물 수정
	public int boardUpdate(BoardDto boardDto) throws Exception;
		
	// 게시물 삭제
	public int boardDelete(int bno) throws Exception;
	
	// 첨부파일 업로드
	public int insertFile(Map<String, Object> map) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	// 첨부파일 다운
	public Map<String, Object> selectFileInfo(int file_no) throws Exception;
	
	// 첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
	
	// 첨부파일 제한
	public int fileCount(int bno) throws Exception;
	
		
	
}
