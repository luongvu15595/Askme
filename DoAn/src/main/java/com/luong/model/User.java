package com.luong.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.*;
import org.hibernate.annotations.CascadeType;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "users")
public class User {

    @Id
    @Column(name = "id_user")
    @GeneratedValue()
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "password")
    private String password;

    @Transient
    private String passwordConfirm;

    @Column(name = "email")
    private String email;

    @Column(name = "image")
    private String image;
    @JsonIgnore
    @ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<Role> roles;


    @JsonIgnore
    @OneToMany(mappedBy = "user")
    @Cascade(CascadeType.ALL)
    private Set<Question> questions = new HashSet<Question>(0);

    @JsonIgnore
    @OneToMany(mappedBy = "user")
    @Cascade(CascadeType.ALL)
    private Set<Answer> answers = new HashSet<Answer>();

    @JsonIgnore
    @OneToMany(mappedBy = "user")
    @Cascade(CascadeType.ALL)
    private Set<Vote_Answer> vote_answers = new HashSet<Vote_Answer>();

    @JsonIgnore
    @OneToMany(mappedBy = "user")
    @Cascade(CascadeType.ALL)
    private Set<Vote_Question> vote_questions = new HashSet<Vote_Question>();



    public User() {
        super();
    }

    public User(int id) {
        super();
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.image = image;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Set<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(Set<Question> questions) {
        this.questions = questions;
    }


    public Set<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<Answer> answers) {
        this.answers = answers;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public Set<Vote_Answer> getVote_answers() {
        return vote_answers;
    }

    public void setVote_answers(Set<Vote_Answer> vote_answers) {
        this.vote_answers = vote_answers;
    }

    public Set<Vote_Question> getVote_questions() {
        return vote_questions;
    }

    public void setVote_questions(Set<Vote_Question> vote_questions) {
        this.vote_questions = vote_questions;
    }
}
