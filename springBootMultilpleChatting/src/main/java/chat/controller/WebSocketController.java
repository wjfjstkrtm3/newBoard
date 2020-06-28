package chat.controller;

import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.WebSocketSession;

import chat.dto.Message;

@Controller
public class WebSocketController {
		
	private SimpMessagingTemplate template;


    @Autowired
    public WebSocketController(SimpMessagingTemplate template) {
      this.template = template;
    }
	
	// 채팅방 받는 함수
	@RequestMapping(value="/test")
	public String test(Model model, @RequestParam(value="roomId",required = false) String roomId) {
		long randomId = (int)(Math.random() * 100) + 1;
		model.addAttribute("roomId", roomId);
		model.addAttribute("randomId", randomId);
		return "test";
	}
	
	// /app/send 요청오면
	// 클라이언트가 서버에게 /send/{roomId}로 메시지를 보내고 여기에 mapping이되고 @SendTo에서 roomId의 자원을 사용가능한거고
	// 함수에서 사용할 시에는 @DestinationVariable을 사용하면 그 값을 사용할수있다
	@MessageMapping("/send/{roomId}")
	@SendTo("/topic/chat/{roomId}")
	public Message EnterMessage(Message message /*@DestinationVariable String roomId*/){
		message.setContent(message.getRandomId() + "님 환영합니다 ^^");
		return message;
		/* template.convertAndSend("/topic/chat/" + message.getRoomId(), message); */
		
	}
	
	@MessageMapping("/message/{roomId}")
	@SendTo("/topic/chat/{roomId}")
	public Message sendMessage(Message message) {
		message.setRandomId("손님" + message.getRandomId() + ":");
		return message;
	}
	
	
}
