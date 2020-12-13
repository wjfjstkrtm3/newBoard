package com.remind.board.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.remind.board.handler.WebSocketHandler;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

	/*
	private final WebSocketHandler webSocketHandler;

	public WebSocketConfig(WebSocketHandler webSocketHandler) {
		this.webSocketHandler = webSocketHandler;
	}
	*/
	@Autowired
	private WebSocketHandler webSocketHandler;
	
	
	// 클라이언트가 url 로 "/chat/" 으로 각각 접근할때의 각각의 핸들러들과 맵핑 시켜주는 역할을 한다
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(webSocketHandler, "/chat");
	}

	
}
