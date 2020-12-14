package com.remind.board.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.remind.board.dao.ChatRoomRepository;
import com.remind.board.dto.ChatMessage;
import com.remind.board.dto.ChatRoom;

@Component
public class WebSocketHandler extends TextWebSocketHandler {

	// private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	@Autowired
	private ChatRoomRepository chatRoomRepository;
	
	private ObjectMapper objectMapper = new ObjectMapper();
	

	/*
	// 연결됬을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("연결되었습니다");
	}
	*/
	
	// 메시지를 전송했을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		// objectMapper를 사용하여 해당 msg를 ChatMessage타입으로 변환
		ChatMessage chatMessage = objectMapper.readValue(msg, ChatMessage.class);
		ChatRoom chatRoom = chatRoomRepository.findRoomById(chatMessage.getChatRoomId());
		chatRoom.handelMessage(session, chatMessage, objectMapper);
		
		
		/*
		for(WebSocketSession sess : sessions) {
			TextMessage msg = new TextMessage(message.getPayload());
		
			sess.sendMessage(msg);
		}
		
		*/
		
	}

	/*
	// 연결이 끊어졌을때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("끊어졌습니다");
	}

	*/
	
	
}
