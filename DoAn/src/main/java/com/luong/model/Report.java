package com.luong.model;

import javax.persistence.*;

/**
 * Created by HP on 4/24/2017.
 */
@Entity
@Table(name = "reports")
public class Report {

    @Id
    @GeneratedValue
    @Column(name = "id_report")
    private int id;

    @Column(name = "content")
    private String content;

    @Column(name = "status")
    private int status;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false, foreignKey = @ForeignKey(name = "report_1"))
    private User user;

    @ManyToOne
    @JoinColumn(name = "question_id", nullable = false, foreignKey = @ForeignKey(name = "report_2"))
    private Question question;

    public Report(){
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }
}
