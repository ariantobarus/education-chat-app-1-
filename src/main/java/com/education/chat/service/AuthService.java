package com.education.chat.service;

import com.education.chat.dto.LoginRequest;
import com.education.chat.dto.RegisterRequest;
import com.education.chat.dto.JwtResponse;
import com.education.chat.model.User;
import com.education.chat.repository.UserRepository;
import com.education.chat.security.JwtTokenProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;

@Service
public class AuthService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtTokenProvider tokenProvider;

    public JwtResponse login(LoginRequest loginRequest) {
        try {
            // STEP 1: Log login attempt
            System.out.println("=== AUTH SERVICE LOGIN START ===");
            System.out.println("Username: " + loginRequest.getUsername());
            System.out.println("Password length: " + loginRequest.getPassword().length());

            // STEP 2: Check if user exists
            User user = userRepository.findByUsername(loginRequest.getUsername()).orElse(null);
            if (user == null) {
                System.out.println("❌ USER NOT FOUND: " + loginRequest.getUsername());
                throw new RuntimeException("User not found");
            }

            System.out.println("✅ USER FOUND:");
            System.out.println("  - Username: " + user.getUsername());
            System.out.println("  - Email: " + user.getEmail());
            System.out.println("  - Role: " + user.getRole());
            System.out.println("  - Active: " + user.isActive());
            System.out.println("  - Password hash preview: " + user.getPassword().substring(0, 20) + "...");

            // STEP 3: Check if user is active
            if (!user.isActive()) {
                System.out.println("❌ USER NOT ACTIVE");
                throw new RuntimeException("User account is disabled");
            }

            // STEP 4: Manual password check BEFORE authentication
            boolean passwordMatches = passwordEncoder.matches(loginRequest.getPassword(), user.getPassword());
            System.out.println("🔐 PASSWORD CHECK:");
            System.out.println("  - Input password: " + loginRequest.getPassword());
            System.out.println("  - Stored hash: " + user.getPassword());
            System.out.println("  - Password matches: " + passwordMatches);

            if (!passwordMatches) {
                System.out.println("❌ PASSWORD MISMATCH - Manual check failed");
                throw new RuntimeException("Invalid password");
            }

            // STEP 5: Try Spring Security authentication
            System.out.println("🔒 ATTEMPTING SPRING SECURITY AUTHENTICATION...");
            Authentication authentication;
            try {
                authentication = authenticationManager.authenticate(
                        new UsernamePasswordAuthenticationToken(
                                loginRequest.getUsername(),
                                loginRequest.getPassword()
                        )
                );
                System.out.println("✅ SPRING SECURITY AUTHENTICATION SUCCESS");
            } catch (Exception authEx) {
                System.out.println("❌ SPRING SECURITY AUTHENTICATION FAILED: " + authEx.getMessage());
                authEx.printStackTrace();
                throw new RuntimeException("Authentication failed: " + authEx.getMessage());
            }

            // STEP 6: Generate token
            String token = tokenProvider.generateToken(authentication);
            user.setLastLogin(LocalDateTime.now());
            userRepository.save(user);

            System.out.println("✅ LOGIN SUCCESS - Token generated");
            System.out.println("Token: " + token.substring(0, 20) + "...");
            System.out.println("=== AUTH SERVICE LOGIN END ===");

            return new JwtResponse(token, user.getUsername(), user.getRole().name());

        } catch (Exception e) {
            System.err.println("❌ AUTH SERVICE LOGIN ERROR: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Login failed: " + e.getMessage());
        }
    }

    public String register(RegisterRequest registerRequest) {
        if (userRepository.existsByUsername(registerRequest.getUsername())) {
            throw new RuntimeException("Username already exists!");
        }

        if (userRepository.existsByEmail(registerRequest.getEmail())) {
            throw new RuntimeException("Email already exists!");
        }

        User user = new User();
        user.setUsername(registerRequest.getUsername());
        user.setEmail(registerRequest.getEmail());
        user.setPassword(passwordEncoder.encode(registerRequest.getPassword()));
        user.setFullName(registerRequest.getFullName());
        user.setRole(User.Role.STUDENT);

        userRepository.save(user);
        return "User registered successfully!";
    }

    public boolean validateToken(String token) {
        return tokenProvider.validateToken(token);
    }

    public String getUsernameFromToken(String token) {
        return tokenProvider.getUsernameFromToken(token);
    }
}
