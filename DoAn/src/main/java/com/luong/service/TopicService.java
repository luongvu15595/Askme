package com.luong.service;

import com.luong.model.Topic;

import java.util.List;
import java.util.Map;

public interface TopicService {
    public Topic find(String name);
    public List<Topic> listTopic();
    public Map<Integer,Integer> countQuestionByTopic();
    public Topic findById(int id);
    public List<String> cut(String topic);
    public Topic add(Topic topic);
    public void del(int id);

}
