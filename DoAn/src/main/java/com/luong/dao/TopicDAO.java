package com.luong.dao;

import com.luong.model.Topic;

public interface TopicDAO {
    public Topic found(String name);

    public void create(Topic t);
}
