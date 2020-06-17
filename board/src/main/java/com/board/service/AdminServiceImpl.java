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
	public void memberDisEnabled(HashMap<String, Object> map) {
		dao.memberDisEnabled(map);
	}

	// 회원목록 다 가져오기
	@Override
	public List<UserDetail> getMemberList() {
		return dao.getMemberList();
	}

	
	
}
