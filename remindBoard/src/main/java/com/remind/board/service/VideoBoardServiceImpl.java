package com.remind.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remind.board.dao.VideoBoardDao;
import com.remind.board.dto.VideoBoardDto;

@Service
public class VideoBoardServiceImpl implements VideoBoardService {

	@Autowired
	private VideoBoardDao dao;
	
	// 동영상 게시물 생성
	@Override
	public void videoWrite(VideoBoardDto videoBoard) throws Exception {
		dao.videoWrite(videoBoard);
	}

	// 동영상 게시물 목록
	@Override
	public List<VideoBoardDto> videoList() throws Exception {
		return dao.videoList();
	}

	// 동영상 게시물 조회
	@Override
	public void videoDetail(int bno) throws Exception {
		dao.videoDetail(bno);
	}

	// 동영상 게시물 수정
	@Override
	public void videoUpdate(VideoBoardDto videoBoardDto) throws Exception {
		dao.videoUpdate(videoBoardDto);
	}

	// 동영상 게시물 삭제
	@Override
	public void videoDelete(int bno) throws Exception {
		dao.videoDelete(bno);
	}
		
	
}
