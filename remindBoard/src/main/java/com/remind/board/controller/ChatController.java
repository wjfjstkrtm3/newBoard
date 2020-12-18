package com.remind.board.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.remind.board.dao.ChatRoomRepository;
import com.remind.board.dto.ChatMessage;
import com.remind.board.dto.ChatRoom;
import com.remind.board.dto.UserDto;
import com.remind.board.service.UserService;
import com.remind.board.utils.Etc;

@Controller
@RequestMapping(value="/chat")
public class ChatController {

	@Autowired
	private ChatRoomRepository chatRoomRepository;
	
	@Autowired
	private UserService userService;
	
	
	// 채팅방 만드는 곳
	@GetMapping(value="/chatting")
	public String createChatRoom(Model model) {
		try {
			model.addAttribute("rooms", chatRoomRepository.findAllRoom());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/chat/chatting";
	}
	
	// 채팅방에 들어갔을때
	@RequestMapping(value="/rooms/{roomId}")
	public String chatRoom(@PathVariable String roomId, Model model) {
		try {
			model.addAttribute("roomId", roomId);
			model.addAttribute("user", Etc.getUser());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/chat/room";
	}
	
	// 새로운 채팅방 만드는 함수
	@GetMapping("/room/new")
	public String make(@RequestParam(value="title") String title, 
			           @RequestParam(value="limit") String limit) {
		// List<ChatRoom> chatRoomList = new ArrayList<ChatRoom>();
		try {
			String name = Etc.getUser();
			UserDto userDto = userService.getUserById(name);
			chatRoomRepository.createChatRoom(title, limit, name, userDto.getImage());
			
			
			// chatRoom을 찾아서 chatRoom에 저장되어있는 session들의 수를 구해서 보내주면됨
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/chat/chatting";
	}
	
	
	// 채팅방에서 메시지 날아왔을때
	@MessageMapping("/send/{roomId}")
	@SendTo("/topic/send/{roomId}")
	public Map<String, Object> send(@PathVariable String roomId, ChatMessage message) {
		// Map을 사용해서 채팅방에서 메시지를 보낸 클라이언트의 image, 메시지 객체 추가
			Map<String, Object> map = null;
		try {
			UserDto userDto = userService.getUserById(message.getWriter());
			map = new HashMap<String, Object>();
			map.put("msg", message);
			map.put("userDto", userDto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	// 채팅방 들어왔을때
	@MessageMapping("/in/{roomId}")
	@SendTo("/topic/in/{roomId}")
	public ChatMessage chatIn(@DestinationVariable String roomId, ChatMessage message) {
		
		try {
			ChatRoom chatRoom = chatRoomRepository.findRoomById(roomId);
			chatRoom.addSession(message.getSessionId());
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		// 여기서는 들어왔을때 해당 채팅방에 session 을 추가해주면됨
		message.setMessage(message.getWriter() + "님 환영합니다");
		return message;
	}
	
	
	// 채팅방 나갔을때
	@MessageMapping("/out/{roomId}")
	@SendTo("/topic/out/{roomId}")
	public ChatMessage chatOut(@DestinationVariable String roomId, ChatMessage message) {
		try {
			ChatRoom chatRoom = chatRoomRepository.findRoomById(roomId);
			chatRoom.getSessionList().remove(message.getSessionId());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		message.setMessage(message.getWriter() + "님 퇴장하셨습니다");
		return message;
	}

	
	
}
