package com.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.dto.BoardReplyVO;

@Repository
public class BoardReplyDAOImpl implements BoardReplyDAO {

	@Autowired
	private SqlSession sqlsession;
	
	// 댓글 리스트
	@Override
	public List<BoardReplyVO> getReplyList(int bno) {
		return sqlsession.selectList("boardReplyMapper.readReply", bno);
	}

	
	// 댓글 페이징 
	@Override
	public List<BoardReplyVO> boardReplyPage(int displayPost, int postNum, int bno) throws Exception {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("displayPost", displayPost);
		map.put("postNum", postNum);
		map.put("bno", bno);
		return sqlsession.selectList("boardReplyMapper.boardReplyPage", map);
	}

	// 댓글 작성
	@Override
	public void writeReply(BoardReplyVO replyVO) {
		sqlsession.insert("boardReplyMapper.insertReply", replyVO);
	}

	// 댓글 수정
	@Override
	public void updateReply(BoardReplyVO replyVO) throws Exception {
		sqlsession.update("boardReplyMapper.updateReply", replyVO);
		
	}

	// 댓글 하나 얻어오기
	@Override
	public BoardReplyVO getReplyOne(int rno) throws Exception {
		return sqlsession.selectOne("boardReplyMapper.selectOneReply", rno);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(int rno) throws Exception {
		sqlsession.delete("boardReplyMapper.deleteReply", rno);
	}

	// 댓글 개수
	@Override
	public int getBoardReplyCount(int bno) throws Exception {
		return sqlsession.selectOne("boardReplyMapper.boardReplyCount", bno);
	}

}
