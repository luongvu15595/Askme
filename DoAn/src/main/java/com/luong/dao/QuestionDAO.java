package com.luong.dao;


import com.luong.model.Question;


import java.util.List;

public interface QuestionDAO {

    public List<Question> listQuestion();

    public Question findById(int id);

    public void add(Question question);

    public List<Question> search(String string);
    //ngay 17/4
    public void remote(int id);

    public void update(Question question);
}
