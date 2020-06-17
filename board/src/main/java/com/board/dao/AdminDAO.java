package com.board.dao;

import java.util.HashMap;
import java.util.List;

import com.board.dto.UserDetail;

public interface AdminDAO {
	
	
	// 회원목록 다 가져오기
	public List<UserDetail> getMemberList();

	// 회원 비활성화
	public void memberDisEnabled(HashMap<String, Object> map);
}
