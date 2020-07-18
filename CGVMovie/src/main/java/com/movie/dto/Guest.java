package com.movie.dto;

import java.sql.Timestamp;

public class Guest {
	private String id;
	private String password;
	private String email;
	private String phoneNumber;
	private String authority;
	private int enabled;
	private Timestamp register_date;
	private Timestamp un_register_date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public Timestamp getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Timestamp register_date) {
		this.register_date = register_date;
	}
	public Timestamp getUn_register_date() {
		return un_register_date;
	}
	public void setUn_register_date(Timestamp un_register_date) {
		this.un_register_date = un_register_date;
	}
	@Override
	public String toString() {
		return "Guest [id=" + id + ", password=" + password + ", email=" + email + ", phoneNumber=" + phoneNumber
				+ ", authority=" + authority + ", enabled=" + enabled + ", register_date=" + register_date
				+ ", un_register_date=" + un_register_date + "]";
	}
	
	
}
