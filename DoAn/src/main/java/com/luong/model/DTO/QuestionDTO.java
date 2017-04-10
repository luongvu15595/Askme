package com.luong.model.DTO;

import com.luong.model.Question;
import com.luong.model.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * Created by Luong-PC on 3/31/2017.
 */
public class QuestionDTO {
    private int id_question;
    private String title;
    private String content;
    private String image;
    private Date time;
    private User user;

    public QuestionDTO() {
    }

    public static QuestionDTO convert(Question q) {
        QuestionDTO qt = new QuestionDTO();
        qt.id_question = q.getId_question();
        qt.title = q.getTitle();
        qt.content = q.getContent();
        qt.image = q.getImage();
        qt.time = q.getTime();
        qt.user = q.getUser();
        return qt;
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
}
