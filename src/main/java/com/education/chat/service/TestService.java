package com.education.chat.service;

import com.education.chat.model.*;
import com.education.chat.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;

@Service
public class TestService {

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private TestSessionRepository testSessionRepository;

    @Autowired
    private TestAnswerRepository testAnswerRepository;

    public TestSession startTest(User user, TestSession.TestType testType, int questionCount) {
        TestSession session = new TestSession();
        session.setUser(user);
        session.setTestType(testType);
        session.setTotalQuestions(questionCount);
        
        // Set duration based on test type
        switch (testType) {
            case TWK -> session.setDurationMinutes(90);
            case TIU -> session.setDurationMinutes(120);
            case TKP -> session.setDurationMinutes(60);
            case MIXED -> session.setDurationMinutes(180);
        }

        return testSessionRepository.save(session);
    }

    public List<Question> getTestQuestions(TestSession.TestType testType, int count) {
        if (testType == TestSession.TestType.MIXED) {
            return questionRepository.findRandomQuestions(count);
        } else {
            Question.QuestionType questionType = Question.QuestionType.valueOf(testType.name());
            return questionRepository.findRandomQuestionsByType(questionType, count);
        }
    }

    public TestAnswer submitAnswer(TestSession session, Question question, String userAnswer, int timeSpent) {
        TestAnswer answer = new TestAnswer();
        answer.setTestSession(session);
        answer.setQuestion(question);
        answer.setUserAnswer(userAnswer);
        answer.setTimeSpentSeconds(timeSpent);
        answer.setCorrect(question.getCorrectAnswer().equals(userAnswer));

        return testAnswerRepository.save(answer);
    }

    public TestSession finishTest(Long sessionId) {
        TestSession session = testSessionRepository.findById(sessionId).orElse(null);
        if (session == null) return null;

        session.setEndTime(LocalDateTime.now());
        session.setStatus(TestSession.SessionStatus.COMPLETED);

        // Calculate score
        List<TestAnswer> answers = testAnswerRepository.findByTestSession(session);
        int correctAnswers = (int) answers.stream().mapToInt(a -> a.isCorrect() ? 1 : 0).sum();
        
        session.setCorrectAnswers(correctAnswers);
        session.setScore((correctAnswers * 100) / session.getTotalQuestions());

        // Calculate actual duration
        long duration = ChronoUnit.MINUTES.between(session.getStartTime(), session.getEndTime());
        session.setDurationMinutes((int) duration);

        return testSessionRepository.save(session);
    }

    public List<TestSession> getUserTestHistory(User user) {
        return testSessionRepository.findByUserOrderByStartTimeDesc(user);
    }

    public TestSession getTestSession(Long sessionId) {
        return testSessionRepository.findById(sessionId).orElse(null);
    }
}
