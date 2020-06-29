package chat.dto;

import java.util.ArrayList;
import java.util.List;

public class Message {

	private String roomId;
	private String content;
	private String randomId;
	private String senderSessionId;
	private List<String> sessionId = new ArrayList<String>();
	
	
	
	public List<String> getSessionId() {
		return sessionId;
	}

	public void setSessionId(List<String> sessionId) {
		this.sessionId = sessionId;
	}

	public Message() {
		
	}
	
	public Message(String roomId, String content, String randomId) {
		this.roomId = roomId;
		this.content = content;
		this.randomId = randomId;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRandomId() {
		return randomId;
	}
	public void setRandomId(String randomId) {
		this.randomId = randomId;
	}
	
	public String getSenderSessionId() {
		return senderSessionId;
	}

	public void setSenderSessionId(String senderSessionId) {
		this.senderSessionId = senderSessionId;
	}

	@Override
	public String toString() {
		return "Message [roomId=" + roomId + ", content=" + content + ", randomId=" + randomId + ", senderSessionId="
				+ senderSessionId + "]";
	}


	
	
}
