package com.remind.board.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer {
	
	// prefix 설정
	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) {
		// 메시지 브로커가 해당 주소를 구독하고 있는 클라이언트에게 메시지 전달
		config.enableSimpleBroker("/topic");
		
		// 클라이언트가 send()할때 메시지를 받을 주소
		config.setApplicationDestinationPrefixes("/app");
	}
	
	// 소켓하고 연결할 수 있는 주소 
	// 클라이언트가 SockJS연결할때 주소랑 똑같이
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
			registry.addEndpoint("/chat").setAllowedOrigins("*").withSockJS();
	}

	
}
