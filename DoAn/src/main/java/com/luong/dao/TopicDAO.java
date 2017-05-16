package com.luong.dao;

import com.luong.model.Topic;

import java.util.List;

public interface TopicDAO {
    public Topic found(String name);

    public void create(Topic t);

    public List<Topic> listTopic();
    public Topic findTopic(int id);
    public void del(int idTopic);
}
