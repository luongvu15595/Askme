package com.luong.model;

import javax.persistence.*;

/**
 * Created by HP on 4/5/2017.
 */
@Entity
@Table(name = "vote_questions")
public class Vote_Question {

    @Id
    @Column(name = "id_vote_question")
    @GeneratedValue()
    private int id;

    @Column(name = "upvote")
    private int upvote;

    @Column(name = "downvote")
    private int downvote;

    @ManyToOne
    @JoinColumn(name = "id_user", nullable = false, foreignKey = @ForeignKey(name = "vote_questions_ibfk_2"))
    private User user;

    @ManyToOne
    @JoinColumn(name = "id_question", nullable = false, foreignKey = @ForeignKey(name = "vote_questions_ibfk_1"))
    private Question question;

    public  Vote_Question(){
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUpvote() {
        return upvote;
    }

    public void setUpvote(int upvote) {
        this.upvote = upvote;
    }

    public int getDownvote() {
        return downvote;
    }

    public void setDownvote(int downvote) {
        this.downvote = downvote;
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
