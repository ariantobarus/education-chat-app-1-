package com.education.chat.dto;

public class ChatMessageRequest {
    private String content;
    private Long receiverId;
    private String roomId;

    // Constructors
    public ChatMessageRequest() {}

    // Getters and Setters
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public Long getReceiverId() { return receiverId; }
    public void setReceiverId(Long receiverId) { this.receiverId = receiverId; }

    public String getRoomId() { return roomId; }
    public void setRoomId(String roomId) { this.roomId = roomId; }
}
