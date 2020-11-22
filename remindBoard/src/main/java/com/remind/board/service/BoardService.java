package com.remind.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.remind.board.dto.BoardDto;

public interface BoardService {

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
	public void boardWrite(BoardDto boardDto, MultipartHttpServletRequest request) throws Exception;	
	
	// 게시물 수정
	public void boardUpdate(BoardDto boardDto, MultipartHttpServletRequest request, String filesNo[], String filesName[]) throws Exception;
	
	// 게시물 삭제
	public int boardDelete(int bno) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	// 첨부파일 다운
	public Map<String, Object> selectFileInfo(int file_no) throws Exception;
}


