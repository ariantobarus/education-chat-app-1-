package com.education.chat.controller;

import com.education.chat.dto.LoginRequest;
import com.education.chat.dto.RegisterRequest;
import com.education.chat.dto.JwtResponse;
import com.education.chat.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "http://127.0.0.1:5500")
public class AuthController {

    @Autowired
    private AuthService authService;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest) {
        try {
            System.out.println("=== AUTH CONTROLLER LOGIN START ===");
            System.out.println("Login request received for: " + loginRequest.getUsername());

            JwtResponse response = authService.login(loginRequest);

            System.out.println("✅ LOGIN SUCCESS in controller");
            System.out.println("Token generated: " + response.getToken().substring(0, 20) + "...");
            System.out.println("Username: " + response.getUsername());
            System.out.println("Role: " + response.getRole());
            System.out.println("=== AUTH CONTROLLER LOGIN END ===");

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            System.err.println("❌ LOGIN CONTROLLER ERROR: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body("Login gagal: " + e.getMessage());
        }
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody RegisterRequest registerRequest) {
        try {
            System.out.println("Register request received for: " + registerRequest.getUsername());
            String message = authService.register(registerRequest);
            return ResponseEntity.ok(message);
        } catch (Exception e) {
            System.err.println("Register error: " + e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/validate")
    public ResponseEntity<?> validateToken(@RequestHeader("Authorization") String token) {
        try {
            // Remove "Bearer " prefix
            if (token.startsWith("Bearer ")) {
                token = token.substring(7);
            }

            boolean isValid = authService.validateToken(token);
            if (isValid) {
                String username = authService.getUsernameFromToken(token);
                return ResponseEntity.ok().body("Token valid for user: " + username);
            } else {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid token");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Token validation failed");
        }
    }
}
