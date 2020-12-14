package com.remind.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.remind.board.dao.ChatRoomRepository;
import com.remind.board.dto.ChatRoom;
import com.remind.board.dto.ChatRoomForm;

@Controller
@RequestMapping(value="/chat")
public class ChatController {

	@Autowired
	private ChatRoomRepository chatRoomRepository;
	
	@GetMapping(value="/chatting")
	public String chatting(Model model) {
		try {
			model.addAttribute("rooms", chatRoomRepository.findAllRoom());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/chat/chatting";
	}
	
	@GetMapping("/room/new")
	public String make(ChatRoomForm form) {
		// List<ChatRoom> chatRoomList = new ArrayList<ChatRoom>();
		try {
			chatRoomRepository.createChatRoom(form.getName());
			// chatRoomList = chatRoomRepository.findAllRoom();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/chat/chatting";
	}
	
	
	@GetMapping("/rooms/{id}")
	public String room(@PathVariable String id, Model model) {
		ChatRoom room = chatRoomRepository.findRoomById(id);
		model.addAttribute("room", room);
		return "/chat/room";
	}
	

	
	
}
