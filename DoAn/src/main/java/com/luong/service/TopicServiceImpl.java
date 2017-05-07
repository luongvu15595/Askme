package com.luong.service;

import com.luong.dao.TopicDAO;
import com.luong.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TopicServiceImpl implements TopicService {
    @Autowired
    TopicDAO topicDAO;

    @Override
    public Topic find(String name) {
        return topicDAO.found(name);
    }

    @Override
    public List<Topic> listTopic() {
        return topicDAO.listTopic();
    }

    @Override
    public Topic findById(int id) {
        return topicDAO.findTopic(id);
    }

    @Override
    public List<String> cut(String topic) {
        topic = topic.replace("[","");
        topic = topic.replace("]","");
        topic = topic.replace("{","");
        topic = topic.replace("}","");
        topic = topic.replace(":","");
        topic = topic.replace(",","");
        topic = topic.trim();
        topic = topic.replaceAll("\\s+", "");

        String[] test = topic.split("\"");
        List<String> listtopic = new ArrayList<String>();
        for(int i=3;i<test.length;i+=4){
            listtopic.add(test[i]);
        }

        return listtopic;
    }

    @Override
    public Topic add(Topic topic) {
        topicDAO.create(topic);
        return topic;
    }
}
