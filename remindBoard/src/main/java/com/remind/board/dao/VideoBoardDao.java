package com.remind.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.remind.board.dto.VideoBoardDto;

@Repository
public interface VideoBoardDao {

	// 동영상 게시물 생성
	public void videoWrite(VideoBoardDto videoBoard) throws Exception;
	
	// 동영상 게시물 목록
	public List<VideoBoardDto> videoList() throws Exception;
	
	// 동영상 게시물 조회
	public void videoDetail(int bno) throws Exception;
	
	// 동영상 게시물 수정
	public void videoUpdate(VideoBoardDto videoBoardDto) throws Exception;	
	
	// 동영상 게시물 삭제
	public void videoDelete(int bno) throws Exception;
	
}
