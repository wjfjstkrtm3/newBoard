package com.remind.board.dto;

public class ChatRoomForm {

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "ChatRoomForm [name=" + name + "]";
	}
	
}
