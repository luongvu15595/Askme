package com.luong.dao;

import com.luong.model.Topic;

/**
 * Created by Luong-PC on 4/4/2017.
 */
public interface TopicDAO {
    public Topic found(String name);
    public void create(Topic t);
}
