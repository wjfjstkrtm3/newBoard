package com.remind.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.remind.board.dao.UserDao;
import com.remind.board.dto.UserDto;

@Controller
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;
	
	// 회원가입
	@Override
	public void userSignUp(UserDto userDto) throws Exception {
		dao.userSignUp(userDto);
	}

	// id로 user 조회
	@Override
	public UserDto getUserById(String id) throws Exception {
		return dao.getUserById(id);
	}

	
	
}
