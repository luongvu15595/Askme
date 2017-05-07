package com.luong.model;

import com.sun.javafx.beans.IDProperty;

import javax.persistence.*;

@Entity
@Table(name = "topic_question")
public class Topic_Qestion {

    @Id
    @Column(name = "id_topic_question")
    private int id;

    @ManyToOne
    @JoinColumn(name = "id_topic", nullable = false, foreignKey = @ForeignKey(name = "topic_question_ibfk_2"))
    private Topic topic;

    @ManyToOne
    @JoinColumn(name = "id_question", nullable = false, foreignKey = @ForeignKey(name = "topic_question_ibfk_1"))
    private Question question;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }
}
