package com.board.dao;

import java.util.List;
import java.util.Map;

import com.board.dto.BoardVO;
import com.board.dto.UserDetail;

public interface UserDAO {

	// 회원가입
	public void userSignUp(UserDetail vo) throws Exception;
	
	// 아이디 체크
	public int idCheck(String id) throws Exception;
	
	// 아이디 찾기
	public UserDetail userFindId(String email) throws Exception;
	
	// 비밀번호 찾기(아이디, 이메일 검증)
	public int userFindPassword(Map<String, Object> map) throws Exception;
	
	// 임시 비밀번호 넣기
	public void temporaryPasswordInsert(Map<String, Object> map) throws Exception;
	
	// 임시 비밀번호 가져오기
	public UserDetail temporaryPasswordSelect(String id) throws Exception;
	
	// 비밀번호 바꾸기
	public int userChangePwd(Map<String, Object> map) throws Exception;
	
	// 북마크 버튼을 누르면 DB에 해당 글을 저장
	public int scrapBoard(Map<String, Object> map) throws Exception;
	
	// boardDetail에 들어갔을때 북마크 체크 여부
	public int scrapCheck(Map<String, Object> map) throws Exception;
	
	// 북마크 된 글 지우기 
	public void scrapBoardDelete(Map<String, Object> map) throws Exception;
	
	// 북마크 한 글 가져오기
	public List<BoardVO> getScrap(String id) throws Exception;
	
	// 내용 펼치기 (내가 쓴글) 
	public List<BoardVO> getWroteBoard(String id) throws Exception;
	
	// 내용 펼치기 (내가 북마크 한 글)
	public List<BoardVO> getBookMark(String id) throws Exception;
}
