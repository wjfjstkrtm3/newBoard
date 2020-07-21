package com.movie.service;

import com.movie.dto.Guest;

public interface GuestService {

	// 게스트 로그인
	public int guestLogin(Guest guest) throws Exception;
}
