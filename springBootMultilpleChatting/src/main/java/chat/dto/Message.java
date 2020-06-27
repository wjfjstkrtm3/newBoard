package chat.dto;

public class Message {

	private String roomId;
	private String content;
	private String randomId;
	
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
	@Override
	public String toString() {
		return "Message [roomId=" + roomId + ", content=" + content + ", randomId=" + randomId + "]";
	}
	
	
}
