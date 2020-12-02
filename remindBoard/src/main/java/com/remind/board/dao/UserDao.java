package com.remind.board.dao;

import com.remind.board.dto.UserDto;

public interface UserDao {

	// 회원가입
	public void userSignUp(UserDto userDto) throws Exception;
	
	// id로 user 조회
	public UserDto getUserById(String id) throws Exception;
	
	// user id 중복체크 
	public int userIdCheck(String id) throws Exception;
	
	// user 마이페이지 수정
	public void mypageUpdate(UserDto userDto) throws Exception;
	
	// 비밀번호 확인
	public UserDto passwordCheck(String id) throws Exception;
}
