package com.education.chat.service;

import com.education.chat.model.ChatMessage;
import com.education.chat.model.User;
import com.education.chat.repository.ChatMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ChatService {

    @Autowired
    private ChatMessageRepository messageRepository;

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    public ChatMessage sendMessage(User sender, User receiver, String content, String roomId) {
        ChatMessage message = new ChatMessage();
        message.setSender(sender);
        message.setReceiver(receiver);
        message.setContent(content);
        message.setRoomId(roomId);
        message.setType(ChatMessage.MessageType.TEXT);

        ChatMessage savedMessage = messageRepository.save(message);

        // Send to WebSocket
        messagingTemplate.convertAndSendToUser(
            receiver.getUsername(),
            "/queue/messages",
            savedMessage
        );

        return savedMessage;
    }

    public ChatMessage sendGroupMessage(User sender, String content, String roomId) {
        ChatMessage message = new ChatMessage();
        message.setSender(sender);
        message.setContent(content);
        message.setRoomId(roomId);
        message.setType(ChatMessage.MessageType.TEXT);

        ChatMessage savedMessage = messageRepository.save(message);

        // Send to group
        messagingTemplate.convertAndSend("/topic/room/" + roomId, savedMessage);

        return savedMessage;
    }

    public List<ChatMessage> getConversation(User user1, User user2) {
        return messageRepository.findConversationBetweenUsers(user1, user2);
    }

    public List<ChatMessage> getRoomMessages(String roomId) {
        return messageRepository.findByRoomIdOrderByCreatedAtAsc(roomId);
    }

    public List<ChatMessage> getUnreadMessages(User user) {
        return messageRepository.findByReceiverAndIsReadFalse(user);
    }

    public void markAsRead(Long messageId) {
        ChatMessage message = messageRepository.findById(messageId).orElse(null);
        if (message != null) {
            message.setRead(true);
            messageRepository.save(message);
        }
    }
}
