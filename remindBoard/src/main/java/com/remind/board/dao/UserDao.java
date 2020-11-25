package com.remind.board.dao;

import com.remind.board.dto.UserDto;

public interface UserDao {

	// 회원가입
	public void userSignUp(UserDto userDto) throws Exception;
	
	// id로 user 조회
	public UserDto getUserById(String id) throws Exception;
}