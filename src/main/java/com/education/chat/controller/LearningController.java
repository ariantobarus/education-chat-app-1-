package com.education.chat.controller;

import com.education.chat.model.LearningModule;
import com.education.chat.model.User;
import com.education.chat.model.UserProgress;
import com.education.chat.repository.UserRepository;
import com.education.chat.service.LearningModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Optional;
import org.springframework.security.core.Authentication;
import com.education.chat.model.*;

@RestController
@RequestMapping("/api/learning")
@CrossOrigin(origins = "*")
public class LearningController {

    @Autowired
    private LearningModuleService learningService;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/modules")
    public ResponseEntity<List<LearningModule>> getAllModules() {
        return ResponseEntity.ok(learningService.getAllModules());
    }

    @GetMapping("/modules/{type}")
    public ResponseEntity<List<LearningModule>> getModulesByType(@PathVariable String type) {
        LearningModule.ModuleType moduleType = LearningModule.ModuleType.valueOf(type.toUpperCase());
        return ResponseEntity.ok(learningService.getModulesByType(moduleType));
    }

    @GetMapping("/module/{id}")
    public ResponseEntity<LearningModule> getModule(@PathVariable Long id) {
        LearningModule module = learningService.getModuleById(id);
        if (module != null) {
            return ResponseEntity.ok(module);
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping("/progress/{moduleId}")
    public ResponseEntity<UserProgress> updateProgress(
            @PathVariable Long moduleId,
            @RequestParam double completion,
            Authentication authentication) {
        
        User user = userRepository.findByUsername(authentication.getName()).orElse(null);
        LearningModule module = learningService.getModuleById(moduleId);
        
        if (user != null && module != null) {
            UserProgress progress = learningService.trackProgress(user, module, completion);
            return ResponseEntity.ok(progress);
        }
        
        return ResponseEntity.badRequest().build();
    }

    @GetMapping("/my-progress")
    public ResponseEntity<List<UserProgress>> getMyProgress(Authentication authentication) {
        User user = userRepository.findByUsername(authentication.getName()).orElse(null);
        if (user != null) {
            return ResponseEntity.ok(learningService.getUserProgress(user));
        }
        return ResponseEntity.badRequest().build();
    }
}
