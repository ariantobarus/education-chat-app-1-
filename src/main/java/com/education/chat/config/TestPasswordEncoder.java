package com.education.chat.config;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class TestPasswordEncoder {
    
    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String rawPassword = "password123";
        String encodedPassword = encoder.encode(rawPassword);
        
        System.out.println("Raw password: " + rawPassword);
        System.out.println("Encoded password: " + encodedPassword);
        
        // Test if they match
        boolean matches = encoder.matches(rawPassword, encodedPassword);
        System.out.println("Passwords match: " + matches);
        
        // Test with existing hash
        String existingHash = "$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.";
        boolean existingMatches = encoder.matches(rawPassword, existingHash);
        System.out.println("Existing hash matches: " + existingMatches);
    }
}
