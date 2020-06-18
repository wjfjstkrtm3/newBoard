package com.board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.AdminDAO;
import com.board.dto.UserDetail;


@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;
	
	
	// 회원 비활성화
	@Override
	public void memberDisEnabled(HashMap<String, Object> map) throws Exception {
		dao.memberDisEnabled(map);
	}

	// 회원목록 다 가져오기
	@Override
	public List<UserDetail> getMemberList() throws Exception {
		return dao.getMemberList();
	}

	// 회원의 활성화 인원수 가져오기
	@Override
	public int countEnabled() throws Exception {
		// TODO Auto-generated method stub
		return dao.countEnabled();
	}

	// 회원의 비활성화 인원수 가져오기
	@Override
	public int countDisEnabled() throws Exception {
		return dao.countDisEnabled();
	}

	
	
}
