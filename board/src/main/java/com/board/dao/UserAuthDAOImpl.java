package com.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.dto.UserDetail;

@Repository
public class UserAuthDAOImpl implements UserAuthDAO{

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public UserDetail getUserById(String username) {
		return sqlsession.selectOne("userMapper.getUserById", username);
	}

}
