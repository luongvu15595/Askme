package com.luong.service;

import com.luong.dao.TopicDAO;
import com.luong.dao.Topic_QuestionDAO;
import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.model.Topic;
import com.luong.model.Topic_Qestion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class Topic_QuestionServiceImpl implements Topic_QuestionService {
    @Autowired
    TopicService topicService;
    @Autowired
    Topic_QuestionDAO topic_questionDAO;
    @Autowired
    TopicDAO topicDAO;
    @Autowired
    QuestionService questionService;

    @Override
    public void add(Topic_Qestion topic_qestion, String name, Question question) {
        Topic t = topicService.find(name);
        topic_qestion.setQuestion(question);
        topic_qestion.setTopic(t);
        topic_questionDAO.add(topic_qestion);
    }
}
