package com.remind.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.remind.board.dto.VideoBoardDto;

@Repository
public class VideoBoardDaoImpl implements VideoBoardDao {

	@Autowired
	private SqlSession sqlsession;
	
	// 동영상 게시물 생성
	@Override
	public void videoWrite(VideoBoardDto videoBoard) throws Exception {
		sqlsession.insert("videoMapper.videoWrite", videoBoard);
		
	}
	
	// 동영상 게시물 목록
	@Override
	public List<VideoBoardDto> videoList() throws Exception {
		return sqlsession.selectList("videoMapper.videoList");
	}
	
	// 동영상 게시물 조회
	@Override
	public void videoDetail(int bno) throws Exception {
		sqlsession.selectOne("videoMapper.videoDetail", bno);
	}
	
	// 동영상 게시물 수정
	@Override
	public void videoUpdate(VideoBoardDto videoBoardDto) throws Exception {
		sqlsession.update("videoMapper.videoUpdate", videoBoardDto);
	}
	
	// 동영상 게시물 삭제
	@Override
	public void videoDelete(int bno) throws Exception {
		sqlsession.delete("videoMapper.videoDelete", bno);
	}

	
	
	
		
	
		
	
	
	
}
