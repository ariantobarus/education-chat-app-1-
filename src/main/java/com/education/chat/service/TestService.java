package com.education.chat.service;

import com.education.chat.model.*;
import com.education.chat.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;
import com.education.chat.repository.QuestionRepository;

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

    public TestAnswer submitAnswer(Long sessionId, Long questionId, String userAnswer, int timeSpent) {
        TestSession session = testSessionRepository.findById(sessionId).orElseThrow(() -> new RuntimeException("Sesi Tes tidak ditemukan"));
        Question question = questionRepository.findById(questionId).orElseThrow(() -> new RuntimeException("Soal tidak ditemukan"));

        TestAnswer answer = new TestAnswer();
        answer.setTestSession(session);
        answer.setQuestion(question);
        answer.setUserAnswer(userAnswer);
        answer.setTimeSpentSeconds(timeSpent);
        answer.setCorrect(question.getCorrectAnswer().equalsIgnoreCase(userAnswer));

        return testAnswerRepository.save(answer);
    }


    public TestSession finishTest(Long sessionId) {
        TestSession session = testSessionRepository.findById(sessionId).orElse(null);
        if (session == null || session.getStatus() == TestSession.SessionStatus.COMPLETED) {
            return session; // atau throw exception
        }

        session.setEndTime(LocalDateTime.now());
        session.setStatus(TestSession.SessionStatus.COMPLETED);

        List<TestAnswer> answers = testAnswerRepository.findByTestSession(session);
        long correctAnswers = answers.stream().filter(TestAnswer::isCorrect).count();

        session.setCorrectAnswers((int) correctAnswers);
        int score = (session.getTotalQuestions() > 0) ? (int) ((correctAnswers * 100) / session.getTotalQuestions()) : 0;
        session.setScore(score);

        return testSessionRepository.save(session);
    }


    public List<TestSession> getUserTestHistory(User user) {
        return testSessionRepository.findByUserOrderByStartTimeDesc(user);
    }

    public TestSession getTestSession(Long sessionId) {
        return testSessionRepository.findById(sessionId).orElse(null);
    }
}
