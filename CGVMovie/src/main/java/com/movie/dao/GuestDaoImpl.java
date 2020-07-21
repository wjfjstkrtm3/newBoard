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

}
