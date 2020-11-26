package com.remind.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.remind.board.dto.UserDto;


@Repository
public class userDaoImpl implements UserDao {

	@Autowired
	private SqlSession sqlsession;
	
	// 회원가입
	@Override
	public void userSignUp(UserDto userDto) throws Exception {
		sqlsession.insert("userMapper.userSignUp", userDto);
	}

	// id로 user 조회
	@Override
	public UserDto getUserById(String id) throws Exception {
		return sqlsession.selectOne("userMapper.getUserById", id);
	}

	// user id 중복체크
	@Override
	public int userIdCheck(String id) throws Exception {
		return sqlsession.selectOne("userMapper.userIdCheck", id);
	}
	
	
	

	
}
