package com.remind.board.service;

import org.springframework.stereotype.Service;

import com.remind.board.dto.UserDto;

@Service
public interface UserService {
	
	// 회원가입
	public void userSignUp(UserDto userDto) throws Exception;
	
	// id로 user 조회
	public UserDto getUserById(String id) throws Exception;
	
	// user id 중복체크 
	public int userIdCheck(String id) throws Exception;
	
	// user 마이페이지 수정
	public void mypageUpdate(UserDto userDto) throws Exception;
	
	
}
