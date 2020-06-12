package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.UserDAO;
import com.board.dto.UserDetail;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;
	

	@Override
	public void userSignUp(UserDetail vo) throws Exception {
		dao.userSignUp(vo);
	}

	@Override
	public int idCheck(String id) throws Exception {
		int result = dao.idCheck(id);
		return result;
	}
}
