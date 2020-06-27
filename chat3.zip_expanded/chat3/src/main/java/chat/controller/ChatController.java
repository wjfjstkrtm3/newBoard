package chat.controller;

import chat.container.Message;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class ChatController {
  private SimpMessagingTemplate template;

  public ChatController(SimpMessagingTemplate template) {
    this.template = template;
  }

  @MessageMapping("/join")
  public void join(Message message) {
    message.setContent(message.getWriter() + "님 입장");
    template.convertAndSend("/topic/room/" + message.getRoomId(), message);
  }

  @MessageMapping("/message")
  public void message(Message message) throws InterruptedException {
    Thread.sleep(300);
    template.convertAndSend("/topic/room/" + message.getRoomId(), message);
  }

  @MessageMapping("/notice")
  public void notice() {
    template.convertAndSend("/topic/notice", true);
  }
}
