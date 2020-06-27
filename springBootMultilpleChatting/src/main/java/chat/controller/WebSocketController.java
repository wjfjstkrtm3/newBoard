package chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	@MessageMapping("/send/{roomId}")
	@SendTo("/topic/chat/{roomId}")
	public Message sendMessage(Message message){
		return new Message(message.getContent(), message.getRandomId() + "님 입장하셨습니다.", message.getRoomId());
		/* template.convertAndSend("/topic/chat/" + message.getRoomId(), message); */
		
	}
	
	
	
}
