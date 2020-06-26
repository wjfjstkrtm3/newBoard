package com.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@ServerEndpoint(value="/websocket")
// 웹소켓 요청을 받는 endPoint
// WEB 소켓으로 접속 가능한 URL 정보를 명시하여 소켓 서버를 생성해주며 프로퍼티를 통해 decoder나 encoder를 명시할 수 있다
public class WebSocketChat {

	private static final List<Session> sessionList = new ArrayList<Session>();
	public WebSocketChat() {
	}
	
	@RequestMapping(value="/user/chat")
	public void getChatViewPage() {
		
	}
	
	
	// 클라이언트가 웹소켓에 들어오고 서버에 아무런 문제 없이 들어왔을때 실행하는 메소드
	@OnOpen
	public void onOpen(Session session) {
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("Connection Established");
		}catch(Exception e) {
			e.printStackTrace();
		}
		sessionList.add(session);
	}
	
	// 모든 사용자에게 메시지를 전달한다
	// 어떠 누군가에게 메시지가 왔다면 그 메시지를 보낸 자신을 제외한 연결된 세션(클라이언트)에게 메시지를 보내는 메소드 
	private void sendAllSessionToMessage(Session self, String message) {
		try {
			for(Session session : WebSocketChat.sessionList) {
				if(!self.getId().equals(session.getId())) {
					session.getBasicRemote().sendText(message);
				}
			}
		}catch(Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}
	}
	
	
	// 클라이언트에게 메시지가 들어왔을 때, 실행되는 메소드
	@OnMessage
	public void onMessage(String message, Session session) {
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("to : " + message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		sendAllSessionToMessage(session, message);
	}
	
	@OnError
	public void onError(Throwable e, Session session) {
		
	}
	
	// 클라이언트와 웹소켓과의 연결이 끊기면 실행되는 메소드
	@OnClose
	public void onClose(Session session) {
		sessionList.remove(session);
	}
	
	
}
