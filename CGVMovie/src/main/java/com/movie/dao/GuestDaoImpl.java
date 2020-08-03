package com.movie.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.dto.Guest;

@Repository
public class GuestDaoImpl implements GuestDao {

	@Autowired
	private SqlSession sqlsession;
	
	// 게스트 로그인
	@Override
	public int guestLogin(Guest guest) throws Exception {
		return sqlsession.selectOne("guestMapper.guestLogin", guest);
	}

	// 회원 비밀번호 조회
	@Override
	public String guestPassword(String id) throws Exception {
		return sqlsession.selectOne("guestMapper.findPassword", id);
	}

	// 아이디 중복 확인
	@Override
	public int guestIdCheck(String id) throws Exception {
		return sqlsession.selectOne("guestMapper.idCheck", id);
	}

	// 회원가입 처리
	@Override
	public void guestSignUp(Guest guest) throws Exception {
		sqlsession.insert("guestMapper.guestSignUp", guest);
	}
	
	

}
