package com.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.dto.UserDetail;


@Repository
public class AdminImplDAO implements AdminDAO {

	@Autowired
	SqlSession sqlsession;
	
	
	@Override
	public void memberDisEnabled(HashMap<String, Object> map) throws Exception {
		sqlsession.update("adminMapper.memberDisEnabled", map);
	}

	
	// 회원의 활성화
	@Override
	public int countEnabled() throws Exception {
		return sqlsession.selectOne("adminMapper.countEnabled");
	}

	// 회원의 활성화 인원수 가져오기
	@Override
	public int countDisEnabled() throws Exception {
		return sqlsession.selectOne("adminMapper.countDisEnabled");
	}

	// 회원의 비활성화 인원수 가져오기
	@Override
	public List<UserDetail> getMemberList() throws Exception {
		return sqlsession.selectList("adminMapper.getMemberList");
	}

}
