package com.example.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.board.dto.boardDTO;

@Repository
public class boardDAOImpl implements boardDAO {

	@Autowired
	private SqlSession sqlsession;

	// 게시물 목록 조회
	@Override
	public List<boardDTO> boardList() throws Exception {
		return sqlsession.selectList("boardMapper.boardList");
	}

	// 게시물 총 개수
	@Override
	public int count() throws Exception {
		return sqlsession.selectOne("boardMapper.count");
	}

	// 게시물 목록 + 페이징(끝이 없는 페이징)
	@Override
	public List<boardDTO> listPage(Map<String, Integer> map) throws Exception {
		return sqlsession.selectList("boardMapper.listPage", map);
	}

}
