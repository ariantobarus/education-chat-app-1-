package com.education.chat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class EducationChatApplication {
    public static void main(String[] args) {
        SpringApplication.run(EducationChatApplication.class, args);
    }
}
