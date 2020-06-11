package com.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.dto.UserDetail;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void userSignUp(UserDetail vo) throws Exception {
		sqlsession.insert("userMapper.userSignUp", vo);
	}

}
