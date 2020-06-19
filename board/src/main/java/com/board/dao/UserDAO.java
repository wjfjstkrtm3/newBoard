package com.board.dao;

import com.board.dto.UserDetail;

public interface UserDAO {

	// 회원가입
	public void userSignUp(UserDetail vo) throws Exception;
	
	// 아이디 체크
	public int idCheck(String id) throws Exception;
	
	// 아이디 찾기
	public UserDetail userFindId(String email) throws Exception;
	
}
