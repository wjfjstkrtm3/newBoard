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

	
	// user id 중복체크 
	@Override
	public int userIdCheck(String id) throws Exception {
		return dao.userIdCheck(id);
	}

	// user 마이페이지 수정
	@Override
	public void mypageUpdate(UserDto userDto) throws Exception {
		dao.mypageUpdate(userDto);
	}

	// user 마이페이지 비밀번호 확인
	@Override
	public UserDto passwordCheck(String id) throws Exception {
		return dao.passwordCheck(id);
	}

	// 로그인 페이지 비밀번호 찾기 (id와 email 일치하는지)
	@Override
	public int checkIdEmail(UserDto userDto) throws Exception {
		return dao.checkIdEmail(userDto);
	}

	// 로그인 페이지 비밀번호 변경
	@Override
	public int updatePassword(UserDto userDto) throws Exception {
		return dao.updatePassword(userDto);
	}
	
	
	
}
