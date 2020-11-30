package com.remind.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.remind.board.dto.VideoBoardDto;

@Service
public interface VideoBoardService {

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
