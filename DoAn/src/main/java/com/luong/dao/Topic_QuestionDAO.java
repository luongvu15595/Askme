package com.luong.dao;

import com.luong.model.Topic_Qestion;

import java.util.List;

public interface Topic_QuestionDAO {
    public void add(Topic_Qestion topic_qestion);
    public List<Topic_Qestion> findlistTQ(int id);
    public List<Topic_Qestion> findListQuestion(int id);
}
