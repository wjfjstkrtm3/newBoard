package com.remind.board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@GetMapping(value="/chatting")
	public String createChatRoom(Model model) {
		try {
			model.addAttribute("rooms", chatRoomRepository.findAllRoom());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/chat/chatting";
	}
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
	
	
	@GetMapping("/room/new")
	public String make(@RequestParam(value="name") String name) {
		// List<ChatRoom> chatRoomList = new ArrayList<ChatRoom>();
		try {
			chatRoomRepository.createChatRoom(name);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/chat/chatting";
	}
	
	@MessageMapping("/send/{roomId}")
	@SendTo("/topic/send/{roomId}")
	public Map<String, Object> send(@PathVariable String roomId, ChatMessage message) {
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
	
	@MessageMapping("/in/{roomId}")
	@SendTo("/topic/in/{roomId}")
	public ChatMessage chatIn(@PathVariable String roomId, ChatMessage message) {
		message.setMessage(message.getWriter() + "님 환영합니다");
		return message;
	}
	
	@MessageMapping("/out/{roomId}")
	@SendTo("/topic/out/{roomId}")
	public ChatMessage chatOut(@PathVariable String roomId, ChatMessage message) {
		message.setMessage(message.getWriter() + "님 퇴장하셨습니다");
		return message;
	}

	
	
}
