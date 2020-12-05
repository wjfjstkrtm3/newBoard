package com.remind.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remind.board.dao.AdminDao;
import com.remind.board.dto.BoardType;

@Service
public interface AdminService {

	// 관리자 페이지에서 게시물 타입(제목)등록
	public void makeBoard(String type) throws Exception;
	
	// 해당 admin계정이 들고있는 게시물 제목 가져오기
	public List<BoardType> getBoardTitleList() throws Exception;
	
	// 게시판 지우기 
	public int boardDelete(String type) throws Exception;
}
