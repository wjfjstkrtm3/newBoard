package chat.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;


@Configuration // 해당 클래스가 스프링의 설정으로 사용됨을 의미
@EnableWebSocketMessageBroker
public class webSocketConfig implements WebSocketMessageBrokerConfigurer{


	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		registry.enableSimpleBroker("/topic"); // 서버가 클라이언트에게 메시지를 보낼때 붙여줄 prefix를 설정 (해당 주소를 구독하고있는 클라이언트들에게 메시지를 전송)
		registry.setApplicationDestinationPrefixes("/app"); // 클라이언트가 서버에게 메시지를 보낼때 붙여줄 prefix를 설정
	}
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/websocket").withSockJS();
	}

	
	
	
}
