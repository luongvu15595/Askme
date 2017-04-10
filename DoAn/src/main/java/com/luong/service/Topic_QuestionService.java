package com.luong.service;

import com.luong.model.Topic_Qestion;

import java.util.List;

/**
 * Created by Luong-PC on 4/4/2017.
 */
public interface Topic_QuestionService {
    public List<String> name(String name);
    public void add(Topic_Qestion topic_qestion, String name);

}
