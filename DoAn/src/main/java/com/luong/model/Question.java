package com.luong.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.*;
import org.hibernate.annotations.CascadeType;

import javax.jws.soap.SOAPBinding;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Table;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * Created by HP on 3/30/2017.
 */

@Entity
@Table(name = "questions")
public class Question {

    @Id
    @Column(name = "id_question")
    @GeneratedValue()
    private int id_question;

    @Column(name = "title")
    private String title;

    @Column(name = "content")
    private String content;

    @Column(name = "image")
    private String image;

    @Column(name = "time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date time;


    @ManyToOne
    @JoinColumn(name = "id_user", nullable = false, foreignKey = @ForeignKey(name = "questions_ibfk_1"))
    private User user;

    @JsonIgnore
    @OneToMany(mappedBy = "question")
    @Cascade(CascadeType.ALL)
    private Set<Answer> answers = new HashSet<Answer>();

    @JsonIgnore
    @OneToMany(mappedBy = "question")
    @Cascade(CascadeType.ALL)
    private Set<Topic_Qestion> topic_qestions = new HashSet<Topic_Qestion>();


    public Question() {
        super();
    }

    public Question(int id) {
        //   this.id_question = id_question;
        super();
        this.id_question=id;
        this.title = title;
        this.content = content;
        this.image = image;
        this.time = time;
        this.user = user;

    }

    public int getId_question() {
        return id_question;
    }

    public void setId_question(int id_question) {
        this.id_question = id_question;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public Set<Topic_Qestion> getTopic_qestions() {
        return topic_qestions;
    }

    public void setTopic_qestions(Set<Topic_Qestion> topic_qestions) {
        this.topic_qestions = topic_qestions;
    }


    public Set<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<Answer> answers) {
        this.answers = answers;
    }



}
