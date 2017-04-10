package com.luong.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by HP on 4/2/2017.
 */
@Entity
@Table(name = "topics")
public class Topic {

    @Id
    @Column(name = "id_topic")
    private int id;

    @Column(name = "name")
    private String name;

    @JsonIgnore
    @OneToMany(mappedBy = "topic")
    @Cascade(CascadeType.ALL)
    private Set<Topic_Qestion> topic_qestions = new HashSet<Topic_Qestion>();

    public Topic(){
        super();
    }
    public Topic(int i) {
        super();
    }
    public Topic(int id,String name){
        super();
        this.id = id;
        this.name =name;
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

    public Set<Topic_Qestion> getTopic_qestions() {
        return topic_qestions;
    }

    public void setTopic_qestions(Set<Topic_Qestion> topic_qestions) {
        this.topic_qestions = topic_qestions;
    }
}
