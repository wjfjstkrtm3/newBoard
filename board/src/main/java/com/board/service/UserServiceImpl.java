package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.UserDAO;
import com.board.dto.UserDetail;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;
	

	// 회원가입
	@Override
	public void userSignUp(UserDetail vo) throws Exception {
		dao.userSignUp(vo);
	}

	// 아이디 중복확인
	@Override
	public int idCheck(String id) throws Exception {
		int result = dao.idCheck(id);
		return result;
	}

	// 아이디 찾기
	@Override
	public UserDetail userFindId(String email) throws Exception {
		return dao.userFindId(email);
	}
}
