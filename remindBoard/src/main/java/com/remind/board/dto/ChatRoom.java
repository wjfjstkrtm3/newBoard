package com.remind.board.dto;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ChatRoom {

	private String roomId;
	private String name;
	private Set<WebSocketSession> sessions = new HashSet<WebSocketSession>();
	
	public static ChatRoom create(String name) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.roomId = UUID.randomUUID().toString();
		chatRoom.name = name;
		return chatRoom;
	}
	
	public void handelMessage(WebSocketSession session, ChatMessage chatMessage, ObjectMapper objectMapper) throws Exception {
		if(chatMessage.getType() == MessageType.ENTER) {
			sessions.add(session);
			chatMessage.setMessage(chatMessage.getWriter() + "님이 입장하셨습니다.");
		}else if(chatMessage.getType() == MessageType.LEAVE) {
			sessions.remove(session);
			chatMessage.setMessage(chatMessage.getWriter() + "님이 퇴장하셨습니다");
		}else {
			chatMessage.setMessage(chatMessage.getWriter() + " : " + chatMessage.getMessage());
		}
		send(chatMessage, objectMapper);
	}
	
	
	private void send(ChatMessage chatMessage, ObjectMapper objectMapper) throws Exception{
		TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(chatMessage.getMessage()));
		for(WebSocketSession sess : sessions) {
			sess.sendMessage(textMessage);
		}
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<WebSocketSession> getSessions() {
		return sessions;
	}

	public void setSessions(Set<WebSocketSession> sessions) {
		this.sessions = sessions;
	}

	@Override
	public String toString() {
		return "ChatRoom [roomId=" + roomId + ", name=" + name + ", sessions=" + sessions + "]";
	}
	
}
