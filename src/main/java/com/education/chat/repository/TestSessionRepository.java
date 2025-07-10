package com.education.chat.repository;

import com.education.chat.model.TestSession;
import com.education.chat.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface TestSessionRepository extends JpaRepository<TestSession, Long> {
    List<TestSession> findByUserOrderByStartTimeDesc(User user);
    List<TestSession> findByUserAndStatusOrderByStartTimeDesc(User user, TestSession.SessionStatus status);
    List<TestSession> findByTestTypeAndStatusOrderByStartTimeDesc(TestSession.TestType testType, TestSession.SessionStatus status);
}
