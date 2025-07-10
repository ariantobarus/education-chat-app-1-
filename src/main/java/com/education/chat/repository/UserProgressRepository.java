package com.education.chat.repository;

import com.education.chat.model.UserProgress;
import com.education.chat.model.User;
import com.education.chat.model.LearningModule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserProgressRepository extends JpaRepository<UserProgress, Long> {
    List<UserProgress> findByUser(User user);
    Optional<UserProgress> findByUserAndModule(User user, LearningModule module);
    List<UserProgress> findByUserAndIsCompletedTrue(User user);
}
