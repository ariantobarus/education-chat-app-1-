package com.education.chat.controller;

import com.education.chat.dto.ChatMessageRequest;
import com.education.chat.model.ChatMessage;
import com.education.chat.model.User;
import com.education.chat.repository.UserRepository;
import com.education.chat.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import java.util.List;

@Controller
public class ChatController {

    @Autowired
    private ChatService chatService;

    @Autowired
    private UserRepository userRepository;

    @MessageMapping("/chat.sendMessage")
    public void sendMessage(@Payload ChatMessageRequest chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        String username = (String) headerAccessor.getSessionAttributes().get("username");
        User sender = userRepository.findByUsername(username).orElse(null);
        
        if (sender != null) {
            if (chatMessage.getRoomId() != null) {
                // Group message
                chatService.sendGroupMessage(sender, chatMessage.getContent(), chatMessage.getRoomId());
            } else if (chatMessage.getReceiverId() != null) {
                // Private message
                User receiver = userRepository.findById(chatMessage.getReceiverId()).orElse(null);
                if (receiver != null) {
                    chatService.sendMessage(sender, receiver, chatMessage.getContent(), null);
                }
            }
        }
    }

    @GetMapping("/api/chat/conversation/{userId}")
    @ResponseBody
    public ResponseEntity<List<ChatMessage>> getConversation(
            @PathVariable Long userId, 
            Authentication authentication) {
        
        User currentUser = userRepository.findByUsername(authentication.getName()).orElse(null);
        User otherUser = userRepository.findById(userId).orElse(null);
        
        if (currentUser != null && otherUser != null) {
            List<ChatMessage> messages = chatService.getConversation(currentUser, otherUser);
            return ResponseEntity.ok(messages);
        }
        
        return ResponseEntity.badRequest().build();
    }

    @GetMapping("/api/chat/room/{roomId}")
    @ResponseBody
    public ResponseEntity<List<ChatMessage>> getRoomMessages(@PathVariable String roomId) {
        List<ChatMessage> messages = chatService.getRoomMessages(roomId);
        return ResponseEntity.ok(messages);
    }

    @GetMapping("/api/chat/unread")
    @ResponseBody
    public ResponseEntity<List<ChatMessage>> getUnreadMessages(Authentication authentication) {
        User user = userRepository.findByUsername(authentication.getName()).orElse(null);
        if (user != null) {
            List<ChatMessage> messages = chatService.getUnreadMessages(user);
            return ResponseEntity.ok(messages);
        }
        return ResponseEntity.badRequest().build();
    }
}
