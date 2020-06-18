package com.board.dao;

import java.util.HashMap;
import java.util.List;

import com.board.dto.UserDetail;

public interface AdminDAO {
	
	
	// 회원목록 다 가져오기
	public List<UserDetail> getMemberList() throws Exception;

	// 회원 비활성화
	public void memberDisEnabled(HashMap<String, Object> map) throws Exception;
	
	// 회원의 활성화 인원수 가져오기
	public int countEnabled() throws Exception;
	
	// 회원의 비활성화 인원수 가져오기
	public int countDisEnabled() throws Exception;
}
