package com.education.chat.repository;

import com.education.chat.model.TestAnswer;
import com.education.chat.model.TestSession;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface TestAnswerRepository extends JpaRepository<TestAnswer, Long> {
    List<TestAnswer> findByTestSession(TestSession testSession);
    List<TestAnswer> findByTestSessionOrderByQuestionId(TestSession testSession);
}
