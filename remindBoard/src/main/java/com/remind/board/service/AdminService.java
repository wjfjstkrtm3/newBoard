package com.remind.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remind.board.dao.AdminDao;

@Service
public interface AdminService {

	// 관리자 페이지에서 게시물 타입(제목)등록
	public void makeBoard(String type) throws Exception;
}
