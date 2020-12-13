package com.remind.board.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.remind.board.dto.ChatRoom;

@Repository
public class ChatRoomRepository {
	private Map<String, ChatRoom> chatRoomMap = new LinkedHashMap<String, ChatRoom>();
	
	public List<ChatRoom> findAllRoom() {
		List<ChatRoom> chatRooms = new ArrayList<ChatRoom>(chatRoomMap.values());
		Collections.reverse(chatRooms);
		return chatRooms;
	}
	
	public ChatRoom findRoomById(String id) {
		return chatRoomMap.get(id);
	}
	
	public ChatRoom createChatRoom(String name) {
		ChatRoom chatRoom = ChatRoom.create(name);
		chatRoomMap.put(chatRoom.getRoomId(), chatRoom);
		System.out.println("createRoom " + chatRoomMap.toString());
		return chatRoom;
	}
	
}
