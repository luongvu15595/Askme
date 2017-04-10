package com.luong.dao;


import com.luong.model.Question;


import java.util.List;

/**
 * Created by HP on 3/30/2017.
 */
public interface QuestionDAO {
    public List<Question> listQuestion();
    public Question findById(int id);
    public void add(Question question);
}
