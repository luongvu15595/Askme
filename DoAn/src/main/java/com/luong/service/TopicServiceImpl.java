package com.luong.service;

import com.luong.dao.TopicDAO;
import com.luong.dao.Topic_QuestionDAO;
import com.luong.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class TopicServiceImpl implements TopicService {
    @Autowired
    TopicDAO topicDAO;
    @Autowired
    Topic_QuestionDAO topic_questionDAO;

    @Override
    public Topic find(String name) {
        return topicDAO.found(name);
    }

    @Override
    public List<Topic> listTopic() {
        Map<Integer,Integer> map = new HashMap<>();
        int count =0;
        List<Topic> list = topicDAO.listTopic();
        for (int i = 0; i<list.size();i++){
            Topic topic = list.get(i);
            count = topic_questionDAO.findlistTQ(topic.getId()).size();
            map.put(topic.getId(),count);
        }
        Map<Integer,Integer> sortByQuestioninTopic = sortByQuestion(map,false);
        List<Topic> listtopic = new ArrayList<>();
        Topic topic = new Topic();
        Set set = sortByQuestioninTopic.entrySet();
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry mentry = (Map.Entry) iterator.next();
            topic = topicDAO.findTopic((Integer) mentry.getKey());
            listtopic.add(topic);
        }

        return listtopic;
    }

    @Override
    public Map<Integer, Integer> countQuestionByTopic() {
        Map<Integer,Integer> map = new HashMap<>();
        int count =0;
        List<Topic> list = topicDAO.listTopic();
        for (int i = 0; i<list.size();i++){
            Topic topic = list.get(i);
            count = topic_questionDAO.findlistTQ(topic.getId()).size();
            map.put(topic.getId(),count);
        }
        return map;
    }

    private static Map<Integer, Integer> sortByQuestion(Map<Integer, Integer> unsortMap, final boolean order) {

        List<Map.Entry<Integer, Integer>> list = new LinkedList<Map.Entry<Integer, Integer>>(unsortMap.entrySet());

        // Sorting the list based on values
        Collections.sort(list, new Comparator<Map.Entry<Integer, Integer>>() {
            public int compare(Map.Entry<Integer, Integer> o1,
                               Map.Entry<Integer, Integer> o2) {
                if (order) {
                    return o1.getValue().compareTo(o2.getValue());
                } else {
                    return o2.getValue().compareTo(o1.getValue());

                }
            }
        });

        // Maintaining insertion order with the help of LinkedList
        Map<Integer, Integer> sortedMap = new LinkedHashMap<Integer, Integer>();
        for (Map.Entry<Integer, Integer> entry : list) {
            sortedMap.put(entry.getKey(), entry.getValue());
        }

        return sortedMap;
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
        for(int i=0;i<test.length;i++) {
            if (test[i].equals("name")) {
                listtopic.add(test[i + 2]);
            }
        }
        return listtopic;
    }

    @Override
    public Topic add(Topic topic) {
        topicDAO.create(topic);
        return topic;
    }
}
