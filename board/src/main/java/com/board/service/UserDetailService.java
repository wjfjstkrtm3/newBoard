package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.board.dao.UserAuthDAO;
import com.board.dto.UserDetail;

public class UserDetailService implements UserDetailsService {

	@Autowired
	private UserAuthDAO userAuthDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDetail user = userAuthDAO.getUserById(username);
		
		if(user == null) {
			throw new UsernameNotFoundException(username);
		}
		return user;
	}

}
