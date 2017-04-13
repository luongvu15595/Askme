package com.luong.service;

import com.luong.model.Topic;

import java.util.List;

public interface TopicService {
    public Topic find(String name);
    public List<Topic> listTopic();
    public Topic findById(int id);
}
