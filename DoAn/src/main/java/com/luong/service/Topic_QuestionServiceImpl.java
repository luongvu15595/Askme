package com.luong.service;

import com.luong.dao.TopicDAO;
import com.luong.dao.Topic_QuestionDAO;
import com.luong.model.Question;
import com.luong.model.Topic;
import com.luong.model.Topic_Qestion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Array;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Luong-PC on 4/4/2017.
 */
@Service
public class Topic_QuestionServiceImpl implements Topic_QuestionService {
    @Autowired
    TopicService topicService;
    @Autowired
    Topic_QuestionDAO topic_questionDAO;
    @Autowired
    TopicDAO topicDAO;

    @Override
    public List<String> name(String name) {
        name = name.trim();
        name = name.replaceAll("\\s+"," ");
        String[] string = name.split(",");
        List<String> s = Arrays.asList(string);
        return s;
    }

    @Override
    public void add(Topic_Qestion topic_qestion, String name) {

//        for(int i=0; i< name.size();i++) {
//            Question q = new Question(1);
//            String s = name.get(i);
//            Topic t = topicService.find(s);
//            if(t == null){
//            t.setName(s);
//            topicDAO.create(t);
//            t = topicService.find(s);
//            }
        Question q = new Question(2);
        Topic t = topicService.find(name);
        if(t.equals(null)){
            t.setName(name);
            topicDAO.create(t);
        }
        topic_qestion.setQuestion(q);
        topic_qestion.setTopic(t);
        topic_questionDAO.add(topic_qestion);


    }
}
