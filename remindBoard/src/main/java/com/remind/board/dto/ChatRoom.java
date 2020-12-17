package com.remind.board.dto;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ChatRoom {

	private String roomId;
	private String name;
	private Set<WebSocketSession> sessions = new HashSet<WebSocketSession>();
	private Set<String> sessionList = new HashSet<String>();
	
	
	public void addSession(String session) {
		sessionList.add(session);
	}
	
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
			chatMessage.setMessage(chatMessage.getMessage());
		}
		send(chatMessage, objectMapper);
	}
	
	
	private void send(ChatMessage chatMessage, ObjectMapper objectMapper) throws Exception{
		// writeValueAsString
		// Java 객체로 부터 JSON을 만들고, 이를 문자열 혹은 byte배열로 반환한다
		TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(chatMessage.getMessage()));
		
		// 해당 방에있는 클라이언트 session에게 Message전달 
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

	public Set<String> getSessionList() {
		return sessionList;
	}

	public void setSessionList(Set<String> sessionList) {
		this.sessionList = sessionList;
	}

	@Override
	public String toString() {
		return "ChatRoom [roomId=" + roomId + ", name=" + name + ", sessions=" + sessions + ", sessionList="
				+ sessionList + "]";
	}

	
}
