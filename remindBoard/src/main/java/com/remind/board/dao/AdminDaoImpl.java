package com.remind.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSession sqlsession;
	
	// 관리자 페이지에서 게시물 타입(제목)등록
	@Override
	public void makeBoard(String type) throws Exception {
		sqlsession.insert("adminMapper.makeBoard", type);
	}

	
	
}
