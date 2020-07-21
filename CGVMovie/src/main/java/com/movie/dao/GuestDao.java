package com.movie.dao;

import com.movie.dto.Guest;

public interface GuestDao {
	
	// 게스트 로그인
	public int guestLogin(Guest guest) throws Exception;
		
}
