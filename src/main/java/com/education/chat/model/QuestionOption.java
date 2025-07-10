package com.education.chat.model;

import jakarta.persistence.*;

@Entity
@Table(name = "question_options")
public class QuestionOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "option_key", nullable = false)
    private String optionKey; // A, B, C, D, E

    @Column(name = "option_text", columnDefinition = "TEXT", nullable = false)
    private String optionText;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id")
    private Question question;

    // Constructors
    public QuestionOption() {}

    public QuestionOption(String optionKey, String optionText, Question question) {
        this.optionKey = optionKey;
        this.optionText = optionText;
        this.question = question;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getOptionKey() { return optionKey; }
    public void setOptionKey(String optionKey) { this.optionKey = optionKey; }

    public String getOptionText() { return optionText; }
    public void setOptionText(String optionText) { this.optionText = optionText; }

    public Question getQuestion() { return question; }
    public void setQuestion(Question question) { this.question = question; }
}
