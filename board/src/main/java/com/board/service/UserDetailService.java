package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.board.dao.UserAuthDAO;
import com.board.dto.UserDetail;


// DB에서 사용자의 정보를 가져오는 클래스
public class UserDetailService implements UserDetailsService {

	@Autowired
	private UserAuthDAO userAuthDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDetail user = userAuthDAO.getUserById(username);
		
		if(user == null) {
			throw new InternalAuthenticationServiceException(username);
		}
		return user;
	}

}
