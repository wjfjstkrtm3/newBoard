package com.remind.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.remind.board.dto.BoardType;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSession sqlsession;
	
	// 관리자 페이지에서 게시물 타입(제목)등록
	@Override
	public void makeBoard(String type) throws Exception {
		sqlsession.insert("adminMapper.makeBoard", type);
	}

	// 해당 admin계정이 들고있는 게시물 제목 가져오기
	@Override
	public List<BoardType> getBoardTitleList() throws Exception {
		return sqlsession.selectList("adminMapper.getBoardTitleList");
	}

	// 게시판 지우기 
	@Override
	public int boardDelete(String type) throws Exception {
		return sqlsession.delete("adminMapper.deleteBoard", type);
	}

	
	
	
	
}
