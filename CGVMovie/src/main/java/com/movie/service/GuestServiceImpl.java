package com.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.dao.GuestDao;
import com.movie.dto.Guest;

@Service
public class GuestServiceImpl implements GuestService {

	@Autowired
	private GuestDao dao;
	
	@Override
	public int guestLogin(Guest guest) throws Exception {
		// TODO Auto-generated method stub
		return dao.guestLogin(guest);
	}

}
