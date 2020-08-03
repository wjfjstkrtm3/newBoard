package com.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.dao.GuestDao;
import com.movie.dto.Guest;

@Service
public class GuestServiceImpl implements GuestService {

	@Autowired
	private GuestDao dao;
	
	// 로그인
	@Override
	public int guestLogin(Guest guest) throws Exception {
		// TODO Auto-generated method stub
		return dao.guestLogin(guest);
	}

	// 아이디 중복체크
	@Override
	public int guestIdCheck(String id) throws Exception {
		return dao.guestIdCheck(id);
	}

	// 회원 비밀번호 조회
	@Override
	public String guestPassword(String id) throws Exception {
		return dao.guestPassword(id);
	}

	// 회원가입
	@Override
	public void guestSignUp(Guest guest) throws Exception {
		dao.guestSignUp(guest);
	}

}
