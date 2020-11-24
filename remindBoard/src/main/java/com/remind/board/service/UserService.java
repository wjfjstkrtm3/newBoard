package com.remind.board.service;

import org.springframework.stereotype.Service;

import com.remind.board.dto.UserDto;

@Service
public interface UserService {
	
	// 회원가입
	public void userSignUp(UserDto userDto) throws Exception;
}
