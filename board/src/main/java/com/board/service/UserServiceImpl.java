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

}
