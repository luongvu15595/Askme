package com.luong.dao;

import com.luong.model.Answer;

import java.util.List;

public interface AnswerDAO {
    public Long count(int id);
    public List<Answer> la();
    public List<Answer> listAnswerOfQuestion(int id);
    public void add(Answer answer);
    public Answer findById(int id);

}
