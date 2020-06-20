package com.board.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.dto.UserDetail;

@Repository
public class UserDAOImpl implements UserDAO{

	

	@Autowired
	private SqlSession sqlsession;
	
	// 회원가입
	@Override
	public void userSignUp(UserDetail vo) throws Exception {
		sqlsession.insert("userMapper.userSignUp", vo);
	}
	
	// 아이디 찾기
	@Override
	public UserDetail userFindId(String email) throws Exception {
		return sqlsession.selectOne("userMapper.userFindId", email);
	}

	// 비밀번호 찾기(아이디, 이메일 검증)
	@Override
	public int userFindPassword(Map<String, Object> map) throws Exception {
		return sqlsession.selectOne("userMapper.userFindPassword", map);
	}

	// 아이디 중복확인
	@Override
	public int idCheck(String id) throws Exception {
		int result = sqlsession.selectOne("userMapper.idCheck", id);
		return result;
	}

	
	// 임시 비밀번호 넣기
	@Override
	public void temporaryPasswordInsert(Map<String, Object> map) throws Exception {
		sqlsession.update("userMapper.temporaryPasswordUpdate", map);
	}

	// 임시 비밀번호 가져오기
	@Override
	public UserDetail temporaryPasswordSelect(String id) throws Exception {
		return sqlsession.selectOne("userMapper.temporaryPasswordSelect", id);
	}

	// 비밀번호 변경
	@Override
	public int userChangePwd(Map<String, Object> map) throws Exception {
		int result = sqlsession.update("userMapper.userChangePwd", map);
		return result;
	}
	
	

}
