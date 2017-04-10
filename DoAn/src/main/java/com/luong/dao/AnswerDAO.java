package com.luong.dao;

import com.luong.model.Answer;

import java.util.List;

/**
 * Created by Luong-PC on 4/3/2017.
 */
public interface AnswerDAO {
    public Long count(int id);
    public List<Answer> la();
    public List<Answer> listAnswerOfQuestion(int id);
    public void add(Answer answer);

}
