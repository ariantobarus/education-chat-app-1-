package com.education.chat.config;

import com.education.chat.model.User;
import com.education.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {
        System.out.println("=== DATA INITIALIZER START ===");
        
        // Check if admin user exists
        if (!userRepository.existsByUsername("admin")) {
            System.out.println("Creating admin user...");
            
            User admin = new User();
            admin.setUsername("admin");
            admin.setEmail("admin@educhat.com");
            admin.setPassword(passwordEncoder.encode("password123"));
            admin.setFullName("Administrator");
            admin.setRole(User.Role.ADMIN);
            admin.setActive(true);
            
            userRepository.save(admin);
            System.out.println("✅ Admin user created successfully");
        } else {
            System.out.println("✅ Admin user already exists");
        }

        // Check if student user exists
        if (!userRepository.existsByUsername("student1")) {
            System.out.println("Creating student1 user...");
            
            User student = new User();
            student.setUsername("student1");
            student.setEmail("student1@educhat.com");
            student.setPassword(passwordEncoder.encode("password123"));
            student.setFullName("Student One");
            student.setRole(User.Role.STUDENT);
            student.setActive(true);
            
            userRepository.save(student);
            System.out.println("✅ Student1 user created successfully");
        } else {
            System.out.println("✅ Student1 user already exists");
        }

        // Verify users
        System.out.println("=== USER VERIFICATION ===");
        User adminUser = userRepository.findByUsername("admin").orElse(null);
        if (adminUser != null) {
            System.out.println("Admin user found:");
            System.out.println("  - Username: " + adminUser.getUsername());
            System.out.println("  - Email: " + adminUser.getEmail());
            System.out.println("  - Role: " + adminUser.getRole());
            System.out.println("  - Active: " + adminUser.isActive());
            System.out.println("  - Password hash: " + adminUser.getPassword().substring(0, 20) + "...");
        }

        User studentUser = userRepository.findByUsername("student1").orElse(null);
        if (studentUser != null) {
            System.out.println("Student1 user found:");
            System.out.println("  - Username: " + studentUser.getUsername());
            System.out.println("  - Email: " + studentUser.getEmail());
            System.out.println("  - Role: " + studentUser.getRole());
            System.out.println("  - Active: " + studentUser.isActive());
        }

        System.out.println("=== DATA INITIALIZER END ===");
    }
}
