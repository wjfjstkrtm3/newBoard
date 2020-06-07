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

	@Override
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		return sqlsession.selectList("boardMapper.listPageSearch", data);
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlsession.insert("boardMapper.insertFile", map);		
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return sqlsession.selectList("boardMapper.selectFileList", bno);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return sqlsession.selectOne("boardMapper.selectFileInfo", map);
	}

	@Override
	public void updateFileList(Map<String, Object> map) throws Exception {
		sqlsession.update("boardMapper.updateFileList", map);
	}
	
	
}
