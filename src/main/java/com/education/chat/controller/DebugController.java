package com.education.chat.controller;

import com.education.chat.model.User;
import com.education.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

@RestController
@RequestMapping("/api/debug")
@CrossOrigin(origins = "*")
public class DebugController {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/database-status")
    public Map<String, Object> getDatabaseStatus() {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // Count total users
            long totalUsers = userRepository.count();
            response.put("totalUsers", totalUsers);
            
            // Get all users
            List<User> users = userRepository.findAll();
            response.put("users", users.stream().map(user -> {
                Map<String, Object> userInfo = new HashMap<>();
                userInfo.put("id", user.getId());
                userInfo.put("username", user.getUsername());
                userInfo.put("email", user.getEmail());
                userInfo.put("role", user.getRole().name());
                userInfo.put("active", user.isActive());
                userInfo.put("passwordHashPreview", user.getPassword().substring(0, 30) + "...");
                return userInfo;
            }).toList());
            
            // Check admin specifically
            User admin = userRepository.findByUsername("admin").orElse(null);
            if (admin != null) {
                response.put("adminExists", true);
                response.put("adminActive", admin.isActive());
                response.put("adminRole", admin.getRole().name());
            } else {
                response.put("adminExists", false);
            }
            
            response.put("success", true);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("error", e.getMessage());
        }
        
        return response;
    }

    @PostMapping("/create-fresh-admin")
    public Map<String, Object> createFreshAdmin() {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // Delete existing admin if exists
            userRepository.findByUsername("admin").ifPresent(userRepository::delete);
            
            // Create fresh admin
            User admin = new User();
            admin.setUsername("admin");
            admin.setEmail("admin@educhat.com");
            admin.setPassword(passwordEncoder.encode("password123"));
            admin.setFullName("Administrator");
            admin.setRole(User.Role.ADMIN);
            admin.setActive(true);
            
            User savedAdmin = userRepository.save(admin);
            
            // Verify the saved admin
            boolean passwordCheck = passwordEncoder.matches("password123", savedAdmin.getPassword());
            
            response.put("success", true);
            response.put("message", "Fresh admin created successfully");
            response.put("adminId", savedAdmin.getId());
            response.put("username", savedAdmin.getUsername());
            response.put("passwordVerification", passwordCheck);
            response.put("newPasswordHash", savedAdmin.getPassword());
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("error", e.getMessage());
            e.printStackTrace();
        }
        
        return response;
    }

    @PostMapping("/test-password-encoding")
    public Map<String, Object> testPasswordEncoding(@RequestParam String password) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // Generate multiple hashes to show they're different
            String hash1 = passwordEncoder.encode(password);
            String hash2 = passwordEncoder.encode(password);
            String hash3 = passwordEncoder.encode(password);
            
            // Test matching
            boolean match1 = passwordEncoder.matches(password, hash1);
            boolean match2 = passwordEncoder.matches(password, hash2);
            boolean match3 = passwordEncoder.matches(password, hash3);
            
            response.put("originalPassword", password);
            response.put("hash1", hash1);
            response.put("hash2", hash2);
            response.put("hash3", hash3);
            response.put("match1", match1);
            response.put("match2", match2);
            response.put("match3", match3);
            response.put("allMatches", match1 && match2 && match3);
            
        } catch (Exception e) {
            response.put("error", e.getMessage());
        }
        
        return response;
    }

    @PostMapping("/direct-login-test")
    public Map<String, Object> directLoginTest(@RequestParam String username, @RequestParam String password) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            System.out.println("=== DIRECT LOGIN TEST ===");
            System.out.println("Username: " + username);
            System.out.println("Password: " + password);
            
            // Find user
            User user = userRepository.findByUsername(username).orElse(null);
            if (user == null) {
                response.put("success", false);
                response.put("error", "User not found");
                return response;
            }
            
            // Check password
            boolean passwordMatches = passwordEncoder.matches(password, user.getPassword());
            
            response.put("success", true);
            response.put("userFound", true);
            response.put("username", user.getUsername());
            response.put("userActive", user.isActive());
            response.put("userRole", user.getRole().name());
            response.put("passwordMatches", passwordMatches);
            response.put("inputPassword", password);
            response.put("storedHash", user.getPassword());
            
            System.out.println("User found: " + user.getUsername());
            System.out.println("Password matches: " + passwordMatches);
            System.out.println("User active: " + user.isActive());
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("error", e.getMessage());
            e.printStackTrace();
        }
        
        return response;
    }
}
