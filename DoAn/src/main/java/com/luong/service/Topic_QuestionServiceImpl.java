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
    public void add( List<String> listtopic, Question question) {
        Topic_Qestion topic_qestion = new Topic_Qestion();
        Topic topic = new Topic();
        System.out.println(listtopic.size());
        for (int i=0;i<listtopic.size();i++) {
            System.out.println("1");
            topic = topicDAO.found(listtopic.get(i));
            System.out.println("2");
            if (topic == null) {
                Topic topic1 = new Topic();
                topic1.setName(listtopic.get(i));
                topicService.add(topic1);
            }
        }
        for (int i=0;i<listtopic.size();i++) {
            topic = topicDAO.found(listtopic.get(i));
            topic_qestion.setQuestion(question);
            topic_qestion.setTopic(topic);
            topic_questionDAO.add(topic_qestion);
        }

    }

    @Override
    public List<Question> findQuestionByTopic(int id) {
        List<Topic_Qestion> tq = topic_questionDAO.findlistTQ(id);
        List<Question> q = new ArrayList<Question>();
        for(int i = 0; i<tq.size();i++){
            q.add(tq.get(i).getQuestion());
        }
        return q;
    }
    // tra ve 1 list Topic theo cau hoi tuong ung
    @Override
    public List<Topic> findTopicByQuestion(int id) {
        List<Topic_Qestion> topic_qestions = topic_questionDAO.findListQuestion(id);
        Topic topic = new Topic();
        List<Topic> topics = new ArrayList<>();
        for(int i=0 ; i<topic_qestions.size();i++){
            topic = topicDAO.findTopic(topic_qestions.get(i).getTopic().getId()) ;
            topics.add(topic);
        }
        return topics ;
    }
    //map cac cau hoi va topic tuong ung
    @Override
    public Map<Integer, List> topicsOfQuestion() {
        QuestionDTO questionDTO = new QuestionDTO();
        List<QuestionDTO> q = questionService.listQuestion();
        List<Topic> t = new ArrayList<>();
        Map<Integer,List> tq = new HashMap<>();
        int id;
        for (int i = 0 ; i<q.size();i++){
            questionDTO = q.get(i);
            id = questionDTO.getId_question();
            t = findTopicByQuestion(id);
            tq.put(id,t);

        }
        return tq;
    }
}
