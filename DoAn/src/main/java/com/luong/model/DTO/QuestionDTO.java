package com.luong.model.DTO;

import com.luong.model.Question;
import com.luong.model.User;


import java.util.Date;

public class QuestionDTO {
    private int id_question;
    private String title;
    private String content;
    private String image;
    private Date time;
    private User user;

    public QuestionDTO() {
        super();
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        QuestionDTO that = (QuestionDTO) o;

        if (getId_question() != that.getId_question()) return false;
        if (!getTitle().equals(that.getTitle())) return false;
        if (!getContent().equals(that.getContent())) return false;
        if (!getImage().equals(that.getImage())) return false;
        if (!getTime().equals(that.getTime())) return false;
        return getUser().equals(that.getUser());
    }

    @Override
    public int hashCode() {
        int result = getId_question();
        result = 31 * result + getTitle().hashCode();
        result = 31 * result + getContent().hashCode();
        result = 31 * result + getImage().hashCode();
        result = 31 * result + getTime().hashCode();
        result = 31 * result + getUser().hashCode();
        return result;
    }
}
