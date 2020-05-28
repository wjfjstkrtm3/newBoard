package com.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.dto.BoardVO;


@Repository
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSession sqlsession;
	
	
	@Override
	public List<BoardVO> list() throws Exception {
		return sqlsession.selectList("boardMapper.list");
		
	}

	@Override
	public void write(BoardVO vo) throws Exception {
		sqlsession.insert("boardMapper.insert", vo);
	}

}
