package com.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public BoardVO listOne(int bno) throws Exception {
		return sqlsession.selectOne("boardMapper.listone", bno);
	}

	@Override
	public void BoardUpdate(BoardVO vo) throws Exception {
		sqlsession.update("boardMapper.boardUpdate", vo);
	}

	@Override
	public void BoardDelete(int bno) throws Exception {
		sqlsession.delete("boardMapper.boardDelete", bno);
	}

	@Override
	public int BoardCount() throws Exception {
		return sqlsession.selectOne("boardMapper.boardCount");
	}

	@Override
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {
		Map<String, Integer> data = new HashMap<String, Integer>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		return sqlsession.selectList("boardMapper.listPage", data);
	}

}
