package com.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.dto.BoardReplyVO;

@Repository
public class BoardReplyDAOImpl implements BoardReplyDAO {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<BoardReplyVO> getReplyList(int bno) {
		return sqlsession.selectList("boardReplyMapper.readReply", bno);
	}

	@Override
	public void writeReply(BoardReplyVO replyVO) {
		sqlsession.insert("boardReplyMapper.insertReply", replyVO);
	}

	@Override
	public void updateReply(BoardReplyVO replyVO) throws Exception {
		sqlsession.update("boardReplyMapper.updateReply", replyVO);
		
	}

	@Override
	public BoardReplyVO getReplyOne(int rno) throws Exception {
		return sqlsession.selectOne("boardReplyMapper.selectOneReply", rno);
	}

	@Override
	public void deleteReply(int rno) throws Exception {
		sqlsession.delete("boardReplyMapper.deleteReply", rno);
	}

}
