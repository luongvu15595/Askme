package com.luong.service;

import com.luong.model.Question;
import com.luong.model.Topic;
import com.luong.model.Topic_Qestion;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface Topic_QuestionService {
    public void add(List<String> listtopic, Question question);
    public List<Question> findQuestionByTopic(int id);
    public List<Topic> findTopicByQuestion(int id);
    public Map<Integer,List> topicsOfQuestion();
}
