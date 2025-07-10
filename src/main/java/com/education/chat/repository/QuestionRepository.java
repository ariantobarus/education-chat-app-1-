package com.education.chat.repository;

import com.education.chat.model.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface QuestionRepository extends JpaRepository<Question, Long> {
    List<Question> findByTypeAndActiveTrue(Question.QuestionType type);
    
    @Query("SELECT q FROM Question q WHERE q.type = :type AND q.active = true ORDER BY RANDOM() LIMIT :limit")
    List<Question> findRandomQuestionsByType(@Param("type") Question.QuestionType type, @Param("limit") int limit);
    
    @Query("SELECT q FROM Question q WHERE q.active = true ORDER BY RANDOM() LIMIT :limit")
    List<Question> findRandomQuestions(@Param("limit") int limit);
}
