package com.luong.dao;

import com.luong.model.Tag_Question;

import java.util.List;

public interface Tag_QuestionDAO {
    public void add(Tag_Question tagQuestion);
    public List<Tag_Question> findlistTQ(int id);
    public List<Tag_Question> findListQuestion(int id);
}
