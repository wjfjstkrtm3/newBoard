package com.remind.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.remind.board.dto.UserDto;


@Repository
public class userDaoImpl implements UserDao {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void userSignUp(UserDto userDto) throws Exception {
		sqlsession.insert("userMapper.userSignUp", userDto);
	}

	
}
