package com.board.dao;

import java.util.List;

import com.board.dto.BoardReplyVO;

public interface BoardReplyDAO {

	// 댓글 조회
	public List<BoardReplyVO> getReplyList(int bno) throws Exception;
	
	// 댓글 작성
	public void writeReply(BoardReplyVO replyVO) throws Exception;;
	
	// 댓글 수정
	public void updateReply(BoardReplyVO replyVO) throws Exception;
	
	// 선택한 댓글 하나 가져오기
	public BoardReplyVO getReplyOne(int rno) throws Exception;
	
	// 댓글 삭제
	public void deleteReply(int rno) throws Exception;
}
