package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import com.board.dto.UserDetail;


// DB에서 가져온 정보와 내가 입력한 정보를 비교하는 클래스
// Authentication은 내가 입력한 정보를 담고있는 객체
public class UserAuthenticationProvider implements AuthenticationProvider{

	@Autowired
    private UserDetailService userDeSer;
 
    @SuppressWarnings("unchecked")
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();
        
        UserDetail user = (UserDetail)userDeSer.loadUserByUsername(username);
        
        
        // 여기서의 password는 내가 입력한 password, user.getPassword()는 DB에서 가져온 password
        if(!matchPassword(password, user.getPassword())) {
            throw new BadCredentialsException(username);
        }
 
        if(!user.isEnabled()) {
            throw new BadCredentialsException(username);
        }
        
        if(!user.isEnabled() || !user.isCredentialsNonExpired()) {
        	throw new AuthenticationCredentialsNotFoundException(username);
        }
        
        return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
    }
 
    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
    
    private boolean matchPassword(String userPwd, String password) {
        return userPwd.equals(password);
    }
 
}


