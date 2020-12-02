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

	// user 마이페이지 수정
	@Override
	public void mypageUpdate(UserDto userDto) throws Exception {
		sqlsession.update("userMapper.mypageUpdate", userDto);
	}

	// user 마이페이지 비밀번호 확인
	@Override
	public UserDto passwordCheck(String id) throws Exception {
		return sqlsession.selectOne("userMapper.passwordCheck", id);
	}

	// 로그인 페이지 비밀번호 찾기 (id와 email 일치하는지)
	@Override
	public int checkIdEmail(UserDto userDto) throws Exception {
		return sqlsession.selectOne("userMapper.checkIdEmail", userDto);
	}

	// 로그인 페이지 비밀번호 변경
	@Override
	public int updatePassword(UserDto userDto) throws Exception {
		return sqlsession.update("userMapper.updatePassword", userDto);
	}
	
	
	
	
	
	

	
}
