package com.luong.model;

import com.sun.javafx.beans.IDProperty;

import javax.persistence.*;

@Entity
@Table(name = "tag_question")
public class Tag_Question {

    @Id
    @Column(name = "id_tag_question")
    private int id;

    @ManyToOne
    @JoinColumn(name = "id_tag", nullable = false, foreignKey = @ForeignKey(name = "topic_question_ibfk_2"))
    private Tag tag;

    @ManyToOne
    @JoinColumn(name = "id_question", nullable = false, foreignKey = @ForeignKey(name = "topic_question_ibfk_1"))
    private Question question;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Tag getTag() {
        return tag;
    }

    public void setTag(Tag tag) {
        this.tag = tag;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }
}
