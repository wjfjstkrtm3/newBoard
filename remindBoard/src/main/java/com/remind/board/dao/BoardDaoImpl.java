package com.remind.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.remind.board.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {

	//@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsseion) {
		this.sqlsession = sqlsseion;
	}
	
	
	// 게시물 목록
	@Override
	public List<BoardDto> list() throws Exception {
		return sqlsession.selectList("boardMapper.list");
	}

	// 총 게시물 수
	@Override
	public int count() throws Exception {
		return sqlsession.selectOne("boardMapper.count");
	}

	// 게시물 목록 + 페이징
	@Override
	public List<BoardDto> listPage(Map<String, Integer> map) throws Exception {
		return sqlsession.selectList("boardMapper.listPage", map);
	}
	
	

}
