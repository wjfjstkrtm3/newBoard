package com.board.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


// 사용자의 정보를 저장할 수 있는 DTO, DOMAIN, VO 클래스
// 오버라이드 된거 이외에 추가할거있으면 추가..
// enabled는 사용하니까 return에 enabled 리턴
@SuppressWarnings("serial")
public class UserDetail implements UserDetails {

	private String id;
	private String password;
	private String authority;
	private boolean enabled;
	private String name;
	private String email;
	private String phoneNumber;
	private String temporaryPassword;
	
	public String getTemporaryPassword() {
		return temporaryPassword;
	}

	public void setTemporaryPassword(String temporaryPassword) {
		this.temporaryPassword = temporaryPassword;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(authority));
		return auth;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}



	@Override
	public String toString() {
		return "UserDetail [id=" + id + ", password=" + password + ", authority=" + authority + ", enabled=" + enabled
				+ ", name=" + name + ", email=" + email + ", phoneNumber=" + phoneNumber + ", temporaryPassword="
				+ temporaryPassword + "]";
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return enabled;
	}

}
