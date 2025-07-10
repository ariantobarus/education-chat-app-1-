package com.education.chat.controller;

import com.education.chat.model.User;
import com.education.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/password-test")
@CrossOrigin(origins = "*")
public class PasswordTestController {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/generate-hash/{password}")
    public Map<String, Object> generatePasswordHash(@PathVariable String password) {
        Map<String, Object> response = new HashMap<>();
        
        String hash = passwordEncoder.encode(password);
        response.put("originalPassword", password);
        response.put("generatedHash", hash);
        response.put("hashLength", hash.length());
        
        // Test if they match
        boolean matches = passwordEncoder.matches(password, hash);
        response.put("verification", matches);
        
        return response;
    }
    
    @PostMapping("/fix-admin-password")
    public Map<String, Object> fixAdminPassword() {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // Generate new hash for "password123"
            String newHash = passwordEncoder.encode("password123");
            
            // Find or create admin user
            User admin = userRepository.findByUsername("admin").orElse(null);
            
            if (admin == null) {
                // Create new admin
                admin = new User();
                admin.setUsername("admin");
                admin.setEmail("admin@educhat.com");
                admin.setFullName("Administrator");
                admin.setRole(User.Role.ADMIN);
            }
            
            admin.setPassword(newHash);
            admin.setActive(true);
            userRepository.save(admin);
            
            response.put("success", true);
            response.put("message", "Admin password fixed successfully");
            response.put("username", "admin");
            response.put("password", "password123");
            response.put("newHash", newHash);
            
            // Verify the fix
            boolean verification = passwordEncoder.matches("password123", admin.getPassword());
            response.put("verification", verification);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("error", e.getMessage());
        }
        
        return response;
    }
    
    @PostMapping("/test-login-direct")
    public Map<String, Object> testLoginDirect(@RequestParam String username, @RequestParam String password) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            User user = userRepository.findByUsername(username).orElse(null);
            
            if (user == null) {
                response.put("success", false);
                response.put("error", "User not found");
                return response;
            }
            
            boolean passwordMatches = passwordEncoder.matches(password, user.getPassword());
            
            response.put("success", true);
            response.put("username", username);
            response.put("userExists", true);
            response.put("userActive", user.isActive());
            response.put("userRole", user.getRole().name());
            response.put("passwordMatches", passwordMatches);
            response.put("inputPassword", password);
            response.put("storedHashPreview", user.getPassword().substring(0, 30) + "...");
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("error", e.getMessage());
        }
        
        return response;
    }
}
