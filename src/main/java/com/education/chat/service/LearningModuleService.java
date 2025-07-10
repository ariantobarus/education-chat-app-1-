package com.education.chat.service;

import com.education.chat.model.LearningModule;
import com.education.chat.model.User;
import com.education.chat.model.UserProgress;
import com.education.chat.repository.LearningModuleRepository;
import com.education.chat.repository.UserProgressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;


@Service
public class LearningModuleService {

    @Autowired
    private LearningModuleRepository moduleRepo;

    @Autowired
    private UserProgressRepository progressRepo;

    public List<LearningModule> getAllModules() {
        return moduleRepo.findByActiveTrueOrderByTypeAscOrderIndexAsc();
    }

    public List<LearningModule> getModulesByType(LearningModule.ModuleType type) {
        return moduleRepo.findByTypeAndActiveTrueOrderByOrderIndex(type);
    }

    public LearningModule getModuleById(Long id) {
        return moduleRepo.findById(id).orElse(null);
    }

    public UserProgress trackProgress(User user, LearningModule module, double completion) {
        UserProgress up = new UserProgress();
        up.setUser(user);
        up.setModule(module);
        up.setCompletionPercentage(completion);
        up.setCompleted(completion >= 100.0);
        up.setLastAccessed(LocalDateTime.now());
        return progressRepo.save(up);
    }

    public List<UserProgress> getUserProgress(User user) {
        return progressRepo.findByUser(user);
    }
    public LearningModule saveModule(LearningModule module) {
        return moduleRepo.save(module);
    }
    public void deleteModule(Long id) {
        moduleRepo.deleteById(id);
    }
}
