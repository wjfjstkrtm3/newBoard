package com.board.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.UserDAO;
import com.board.dto.UserDetail;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;
	

	// 회원가입
	@Override
	public void userSignUp(UserDetail vo) throws Exception {
		dao.userSignUp(vo);
	}

	// 아이디 중복확인
	@Override
	public int idCheck(String id) throws Exception {
		int result = dao.idCheck(id);
		return result;
	}

	// 아이디 찾기
	@Override
	public UserDetail userFindId(String email) throws Exception {
		return dao.userFindId(email);
	}

	// 비밀번호 찾기(아이디, 이메일 검증)
	@Override
	public int userFindPassword(Map<String, Object> map) throws Exception {
		return dao.userFindPassword(map);
	}

	// 임시 비밀번호 넣기
	@Override
	public void temporaryPasswordInsert(Map<String, Object> map) throws Exception {
		dao.temporaryPasswordInsert(map);
	}

	// 임시 비밀번호 가져오기 
	@Override
	public UserDetail temporaryPasswordSelect(String id) throws Exception {
		return dao.temporaryPasswordSelect(id);
	}

	
	// 비밀번호 변경
	@Override
	public int userChangePwd(Map<String, Object> map) throws Exception {
		int result = dao.userChangePwd(map);
		return result;
	}
}
