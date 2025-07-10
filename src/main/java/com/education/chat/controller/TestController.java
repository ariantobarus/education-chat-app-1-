package com.education.chat.controller;

import com.education.chat.dto.TestAnswerRequest;
import com.education.chat.model.Question;
import com.education.chat.model.TestSession;
import com.education.chat.model.User;
import com.education.chat.repository.UserRepository;
import com.education.chat.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import org.springframework.http.HttpStatus;
import com.education.chat.model.TestAnswer; // <-- PERBAIKAN: Tambahkan import ini

@RestController
@RequestMapping("/api/test")
@CrossOrigin(origins = "*")
public class TestController {

    @Autowired
    private TestService testService;

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/start")
    public ResponseEntity<Map<String, Object>> startTest(
            @RequestParam String testType,
            @RequestParam(defaultValue = "20") int questionCount,
            Authentication authentication) {

        Map<String, Object> response = new HashMap<>();

        try {
            User user = userRepository.findByUsername(authentication.getName()).orElse(null);
            if (user == null) {
                response.put("success", false);
                response.put("error", "User not found");
                return ResponseEntity.badRequest().body(response);
            }

            TestSession.TestType type = TestSession.TestType.valueOf(testType.toUpperCase());
            TestSession session = testService.startTest(user, type, questionCount);
            List<Question> questions = testService.getTestQuestions(type, questionCount);

            response.put("success", true);
            response.put("sessionId", session.getId());
            response.put("testType", testType);
            response.put("totalQuestions", questionCount);
            response.put("duration", session.getDurationMinutes());
            response.put("questions", questions);

            return ResponseEntity.ok(response);

        } catch (Exception e) {
            response.put("success", false);
            response.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }

    @PostMapping("/submit")
    public ResponseEntity<?> submitAnswer(@RequestBody TestAnswerRequest answerRequest, Authentication authentication) {
        User user = userRepository.findByUsername(authentication.getName()).orElse(null);
        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        TestAnswer answer = testService.submitAnswer(
                answerRequest.getSessionId(),
                answerRequest.getQuestionId(),
                answerRequest.getAnswer(),
                answerRequest.getTimeSpent()
        );
        return ResponseEntity.ok(answer);
    }

    @PostMapping("/finish/{sessionId}")
    public ResponseEntity<TestSession> finishTest(@PathVariable Long sessionId, Authentication authentication) {
        User user = userRepository.findByUsername(authentication.getName()).orElse(null);
        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        TestSession finishedSession = testService.finishTest(sessionId);
        if (finishedSession != null) {
            return ResponseEntity.ok(finishedSession);
        }
        return ResponseEntity.notFound().build();
    }


    @GetMapping("/history")
    public ResponseEntity<List<TestSession>> getTestHistory(Authentication authentication) {
        try {
            User user = userRepository.findByUsername(authentication.getName()).orElse(null);
            if (user == null) {
                return ResponseEntity.badRequest().build();
            }

            List<TestSession> history = testService.getUserTestHistory(user);
            return ResponseEntity.ok(history);

        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/session/{sessionId}")
    public ResponseEntity<TestSession> getTestSession(@PathVariable Long sessionId) {
        try {
            TestSession session = testService.getTestSession(sessionId);
            if (session != null) {
                return ResponseEntity.ok(session);
            }
            return ResponseEntity.notFound().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
}