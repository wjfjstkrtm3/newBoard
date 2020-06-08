package com.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.board.dto.BoardVO;

public interface BoardService {

	// 게시물 목록
	public List<BoardVO> list() throws Exception;

	// 게시물 쓰기
	public void write(BoardVO vo, HttpServletRequest request) throws Exception;

	// 게시물 조회
	public BoardVO listOne(int bno) throws Exception;

	// 게시물 수정
	public void BoardUpdate(BoardVO vo, MultipartHttpServletRequest request, String[] files, String[] fileNames) throws Exception;
	
	// 게시물 삭제
	public void BoardDelete(int bno) throws Exception;
	
	// 게시물 총 개수
	public int BoardCount() throws Exception;
	
	// 게시물 목록 + 페이징
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception; 
	
	// 게시물 목록 + 페이징 + 검색
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	// 파일 가져오기
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	// 파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	// 게시판 조회수
	public void boardHit(int bno) throws Exception;
}
