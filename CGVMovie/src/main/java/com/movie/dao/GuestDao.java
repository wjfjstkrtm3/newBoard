package com.movie.dao;

import com.movie.dto.Guest;

public interface GuestDao {
	
	// 게스트 로그인
	public int guestLogin(Guest guest) throws Exception;
		
	// 아이디 중복 확인
	public int guestIdCheck(String id) throws Exception;
	
	// 회원가입 처리 
	public void guestSignUp(Guest guest) throws Exception;
	
	// 회원 비밀번호 조회
	public String guestPassword(String id) throws Exception;
}
