package com.education.chat.repository;

import com.education.chat.model.LearningModule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface LearningModuleRepository extends JpaRepository<LearningModule, Long> {

    List<LearningModule> findByTypeAndActiveTrueOrderByOrderIndex(LearningModule.ModuleType type);

    List<LearningModule> findByActiveTrueOrderByTypeAscOrderIndexAsc();
}


