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
		
		// Map에있는 value값 ChatRoom을 ArrayList에 담아줌
		List<ChatRoom> chatRooms = new ArrayList<ChatRoom>(chatRoomMap.values());
		
		// ArrayList를 내림차순으로 정렬 (최신 채팅방을 맨위에 있게 하기위해서)
		Collections.reverse(chatRooms);
		
		return chatRooms;
	}
	
	public ChatRoom findRoomById(String id) {
		return chatRoomMap.get(id);
	}
	
	public ChatRoom createChatRoom(String name) {
		ChatRoom chatRoom = ChatRoom.create(name);
		chatRoomMap.put(chatRoom.getRoomId(), chatRoom);
		return chatRoom;
	}
	
}
