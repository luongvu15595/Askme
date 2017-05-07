package com.luong.service;

import com.luong.model.Topic;

import java.util.List;

public interface TopicService {
    public Topic find(String name);
    public List<Topic> listTopic();
    public Topic findById(int id);
    public List<String> cut(String topic);
    public Topic add(Topic topic);

}
