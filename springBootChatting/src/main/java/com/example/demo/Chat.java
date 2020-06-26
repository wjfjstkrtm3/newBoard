package com.example.demo;

public class Chat {

	private String name;
	private String message;
	
	public Chat() {
		
	}
	
	public Chat(String name, String message) {
		this.name = name;
		this.message = message;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	@Override
	public String toString() {
		return "chat [name=" + name + ", message=" + message + "]";
	}
	
	
}
