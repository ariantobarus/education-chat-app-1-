package com.education.chat.controller;

import com.education.chat.model.LearningModule;
import com.education.chat.model.Question;
import com.education.chat.model.User;
import com.education.chat.repository.QuestionRepository;
import com.education.chat.repository.UserRepository;
import com.education.chat.service.LearningModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/admin")
@CrossOrigin(origins = "*")
@PreAuthorize("hasRole('ADMIN')")
public class AdminController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private LearningModuleService learningService;

    @Autowired
    private QuestionRepository questionRepository;

    @GetMapping("/users")
    public ResponseEntity<List<User>> getAllUsers() {
        return ResponseEntity.ok(userRepository.findAll());
    }

    @PostMapping("/users/{userId}/toggle-status")
    public ResponseEntity<User> toggleUserStatus(@PathVariable Long userId) {
        User user = userRepository.findById(userId).orElse(null);
        if (user != null) {
            user.setActive(!user.isActive());
            return ResponseEntity.ok(userRepository.save(user));
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping("/modules")
    public ResponseEntity<LearningModule> createModule(@RequestBody LearningModule module) {
        return ResponseEntity.ok(learningService.saveModule(module));
    }

    @PutMapping("/modules/{id}")
    public ResponseEntity<LearningModule> updateModule(@PathVariable Long id, @RequestBody LearningModule module) {
        module.setId(id);
        return ResponseEntity.ok(learningService.saveModule(module));
    }

    @DeleteMapping("/modules/{id}")
    public ResponseEntity<Void> deleteModule(@PathVariable Long id) {
        learningService.deleteModule(id);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/questions")
    public ResponseEntity<List<Question>> getAllQuestions() {
        return ResponseEntity.ok(questionRepository.findAll());
    }

    @PostMapping("/questions")
    public ResponseEntity<Question> createQuestion(@RequestBody Question question) {
        return ResponseEntity.ok(questionRepository.save(question));
    }

    @PutMapping("/questions/{id}")
    public ResponseEntity<Question> updateQuestion(@PathVariable Long id, @RequestBody Question question) {
        question.setId(id);
        return ResponseEntity.ok(questionRepository.save(question));
    }

    @DeleteMapping("/questions/{id}")
    public ResponseEntity<Void> deleteQuestion(@PathVariable Long id) {
        Question question = questionRepository.findById(id).orElse(null);
        if (question != null) {
            question.setActive(false);
            questionRepository.save(question);
        }
        return ResponseEntity.ok().build();
    }
}
