package com.board.dao;

import com.board.dto.UserDetail;

public interface UserAuthDAO {

	// id로 회원정보찾기
	public UserDetail getUserById(String username);
	
	
	
}
