package com.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.dto.UserDetail;

@Repository
public class UserDAOImpl implements UserDAO{

	

	@Autowired
	private SqlSession sqlsession;
	
	// 회원가입
	@Override
	public void userSignUp(UserDetail vo) throws Exception {
		sqlsession.insert("userMapper.userSignUp", vo);
	}
	
	// 아이디 찾기
	@Override
	public UserDetail userFindId(String email) throws Exception {
		return sqlsession.selectOne("userMapper.userFindId", email);
	}

	// 아이디 중복확인
	@Override
	public int idCheck(String id) throws Exception {
		int result = sqlsession.selectOne("userMapper.idCheck", id);
		return result;
	}

}
