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
	public void memberDisEnabled(HashMap<String, Object> map) {
		sqlsession.update("adminMapper.memberDisEnabled", map);
	}

	@Override
	public List<UserDetail> getMemberList() {
		return sqlsession.selectList("adminMapper.getMemberList");
	}

}
