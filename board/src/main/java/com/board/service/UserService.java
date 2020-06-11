package com.board.service;

import com.board.dto.UserDetail;

public interface UserService {

	// 회원가입
	public void userSignUp(UserDetail vo) throws Exception;
	
	
}
