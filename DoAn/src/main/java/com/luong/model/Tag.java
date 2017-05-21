package com.luong.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tags")
public class Tag {

    @Id
    @Column(name = "id_tag")
    private int id;

    @Column(name = "name")
    private String name;

    @JsonIgnore
    @OneToMany(mappedBy = "tag")
    @Cascade(CascadeType.ALL)
    private Set<Tag_Question> tagQuestions = new HashSet<Tag_Question>();

    public Tag() {
        super();
    }

    public Tag(int i) {
        super();
    }

    public Tag(int id, String name) {
        super();
        this.id = id;
        this.name = name;
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

    public Set<Tag_Question> getTagQuestions() {
        return tagQuestions;
    }

    public void setTagQuestions(Set<Tag_Question> tagQuestions) {
        this.tagQuestions = tagQuestions;
    }


}
