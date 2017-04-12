package com.luong.model;

import javax.persistence.*;

/**
 * Created by HP on 4/5/2017.
 */
@Entity
@Table(name = "vote_answers")
public class Vote_Answer {

    @Id
    @Column(name = "id_vote_answer")
    @GeneratedValue()
    private  int id;

    @Column(name = "upvote")
    private  int upvote;

    @Column(name = "downvote")
    private  int downvote;


    @ManyToOne
    @JoinColumn(name = "id_user", nullable = false, foreignKey = @ForeignKey(name = "vote_answers_ibfk_1"))
    private User user;

    @ManyToOne
    @JoinColumn(name = "id_answer", nullable = false, foreignKey = @ForeignKey(name = "vote_answers_ibfk_2"))
    private Answer answer;



    public Vote_Answer() {
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

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "Vote_Answer{" +
                "id=" + id +
                ", upvote=" + upvote +
                ", downvote=" + downvote +
                ", user=" + user +
                ", answer=" + answer +
                '}';
    }
}
