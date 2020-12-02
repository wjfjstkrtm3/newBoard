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
	
	// user 마이페이지 비밀번호 확인
	public UserDto passwordCheck(String id) throws Exception;
	
	// 로그인 페이지 비밀번호 찾기 (id와 email 일치하는지)
	public int checkIdEmail(UserDto userDto) throws Exception;
	
	// 로그인 페이지 비밀번호 변경
	public int updatePassword(UserDto userDto) throws Exception; 
}
