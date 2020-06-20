package com.board.service;

import java.util.Map;

import com.board.dto.UserDetail;

public interface UserService {

	// 회원가입
	public void userSignUp(UserDetail vo) throws Exception;
	
	// 아이디 체크
	public int idCheck(String id) throws Exception;
	
	// 아이디 찾기
	public UserDetail userFindId(String email) throws Exception;
	
	// 비밀번호 찾기(아이디, 이메일 검증)
	public int userFindPassword(Map<String, Object> map) throws Exception;
	
	// 임시비밀번호 넣기
	public void temporaryPasswordInsert(Map<String, Object> map) throws Exception;
	
	// 임시 비밀번호 가져오기
	public UserDetail temporaryPasswordSelect(String id) throws Exception;
	
	// 비밀번호 바꾸기
	public int userChangePwd(Map<String, Object> map) throws Exception;
}
