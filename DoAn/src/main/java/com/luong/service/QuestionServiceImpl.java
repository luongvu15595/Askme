package com.luong.service;

import com.luong.dao.*;
import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.model.Topic;
import com.luong.model.User;
import com.luong.model.Vote_Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by HP on 3/30/2017.
 */
@Service
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    QuestionDAO dao;

    @Autowired
    UserDAO userDAO;
    @Autowired
    AnswerDAO answerDAO;
    @Autowired
    Vote_QuestionDAO vote_questionDAO;
    @Autowired
    Topic_QuestionService topic_questionService;

    @Override
    public QuestionDTO findById(int id) {

        return QuestionDTO.convert(dao.findById(id));
    }


    @Override
    public List<QuestionDTO> listQuestion() {
        QuestionDTO qt = new QuestionDTO();
        List<QuestionDTO> lq = new ArrayList<QuestionDTO>();
        List<Question> q = dao.listQuestion();
        for (int i = 0; i < q.size(); i++) {
            qt = QuestionDTO.convert(q.get(i));
            Date time;
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            lq.add(qt);
        }
        return lq;
    }

    @Override
    public Question add(Question question, User user) {
        question.setTime(new Date());
        question.setUser(user);
        dao.add(question);
        return question;
    }

    //27/4/2017
    @Override
    public List<Question> search(String string) {

        boolean test = false;
        String title;
        string = string.trim().toLowerCase();

        string = string.replaceAll("\\s+", " ");
        String[] key1 = string.split(" ");
        //lay ra map cac tu khoa va so lan xuat hien
        Map<String, Integer> map = new HashMap<String, Integer>();
        for (String x : key1) {
            if (map.containsKey(x)) {
                map.put(x, map.get(x) + 1);
            } else {
                map.put(x, 1);
            }
        }
        Question question = new Question();
        List<Question> lq3 = new ArrayList<Question>();
        List<Question> lq2 = new ArrayList<Question>();
        List<Question> lq1 = new ArrayList<Question>();
        List<Question> lq = new ArrayList<Question>();
        lq = dao.listQuestion();
        // tra ve 1 list cac bai viet chua tu khoa tim kiem
        Set set = map.entrySet();
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry mentry = (Map.Entry) iterator.next();
            mentry.getKey();
            String regex1 = "([\\s\\w\\W])*" + mentry.getKey() + "((\\s*)([\\w\\W]*))*";
            for (int j = 0; j < lq.size(); j++) {
                question = lq.get(j);
                title = question.getTitle().toLowerCase();
                test = title.matches(regex1);
                if (test) {
                    lq1.add(question);
                }
            }
            HashSet h = new HashSet(lq1);
            lq1.clear();
            lq1.addAll(h);
            lq3 = lq1;
        }
        //tra ve 1 list cac bai viet du tu khoa va theo thu tu va tra ve 1 list cac cau hoi con lai
        String regex = "([\\s\\w\\W])*" + key1[0];
        for (int i = 1; i < key1.length; i++) {
            regex = regex + "((\\s+)([\\w\\W]*))*" + "(\\s)+" + key1[i];
        }
        regex = regex + "((\\s+)([\\w\\W]*))*";
        for (int j = 0; j < lq1.size(); j++) {
            question = lq1.get(j);
            title = question.getTitle().toLowerCase();
            test = title.matches(regex);
            if (test) {
                lq2.add(question);
                lq3.remove(question);
            }
        }
        //tra ve 1 map key id cau hoi value la so lan moi key xuat hien
        Map<Integer, Integer> map3 = new HashMap<>();
        for (int i = 0; i < lq3.size(); i++) {
            question = lq3.get(i);
            title = question.getTitle();
            int count = 0;
            Set set3 = map.entrySet();
            Iterator iterator3 = set3.iterator();
            while (iterator3.hasNext()) {
                Map.Entry mentry3 = (Map.Entry) iterator3.next();
                mentry3.getKey();
                String key = (String) mentry3.getKey();
                //key xuat hien 1 lan dau hoac lan dau tien
                String regex4 = "([\\s\\w\\W])*" + key + "((\\s+)([\\w\\W]*))*";
                test = title.matches(regex4);
                if (test) {
                    count++;
                    if (map3.containsKey(question.getId_question())) {
                        map3.put(question.getId_question(), count);
                    } else {
                        map3.put(question.getId_question(), count);
                    }
                }

                //key xuat hien tu 2 lan tro len
                String regex3 = "([\\s\\w\\W])*" + key;
                for (int j = 1; j < (Integer) mentry3.getValue(); j++) {
                    int count3 = 0;
                    regex3 = regex3 + "((\\s+)([\\w\\W]*))*" + "(\\s)+" + key;
                    regex3 = regex3 + "((\\s+)([\\w\\W]*))*";

                    test = title.matches(regex3);

                    if (test) {
                        count++;
                        if (map3.containsKey(question.getId_question())) {
                            map3.put(question.getId_question(), count);
                        } else {
                            map3.put(question.getId_question(), count);
                        }
                    } else {
                        break;
                    }
                }

            }
        }
        //sap xep map theo chieu giam dan value
        Map<Integer, Integer> sortedMapDesc = sortByComparator(map3, false);
        List<Question> lq4 = new ArrayList<>();
        Question question1 = new Question();
        Set set1 = sortedMapDesc.entrySet();
        Iterator iterator4 = set1.iterator();
        while (iterator4.hasNext()) {
            Map.Entry mentry4 = (Map.Entry) iterator4.next();
            question1 = dao.findById((Integer) mentry4.getKey());
            lq2.add(question1);
        }


        return lq2;


    }

    //sap xep map theo value giam dan
    private static Map<Integer, Integer> sortByComparator(Map<Integer, Integer> unsortMap, final boolean order) {

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
    public void update(Question question) {
        Question question1 = dao.findById(question.getId_question());
        question1.setContent(question.getContent());
        question1.setTitle(question.getTitle());
        dao.update(question1);
    }

    @Override
    public void del(int id) {
        dao.del(id);
    }

    @Override
    public Map<Integer, Long> countUpVote() {
        List<Question> questions = dao.listQuestion();
        Long voteup;
        Map<Integer,Long> map = new HashMap<>();
        for (int i=0;i<questions.size();i++){
            voteup = vote_questionDAO.countUp(questions.get(i).getId_question());
            map.put(questions.get(i).getId_question(),voteup);
        }
        return map;
    }

    @Override
    public Map<Integer, Long> countAnswerHotWeek() {
        List<Question> hotweek = dao.hotweek();
        Long count ;
        Map<Integer,Long> mapHotWeek = new HashMap<>();
        for (int i =0; i<hotweek.size();i++){
            count = answerDAO.count(hotweek.get(i).getId_question());
            mapHotWeek.put(hotweek.get(i).getId_question(),count);
        }
        return mapHotWeek;
    }

    @Override
    public List<Question> sortHotWeek() {
        Map<Integer,Long> mapQuestionWeek = new HashMap<>();
        List<Question> hotWeek = dao.hotweek();
        Long countVoteUp;
        Long countAnswer;
        Long total;
        for(int i = 0; i<hotWeek.size();i++) {
             countVoteUp = vote_questionDAO.countUp(hotWeek.get(i).getId_question());
             countAnswer = answerDAO.count(hotWeek.get(i).getId_question());
             total = countVoteUp + countAnswer;
             mapQuestionWeek.put(hotWeek.get(i).getId_question(),total);
        }
        Map<Integer,Long> sortByHotWeek = sortByQuestion(mapQuestionWeek,false);
        List<Question> listQuestionHot = new ArrayList<>();
        Question question = new Question();
        Set set = sortByHotWeek.entrySet();
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry mentry = (Map.Entry) iterator.next();
            question = dao.findById((Integer) mentry.getKey());
            listQuestionHot.add(question);
        }

        return listQuestionHot;
    }

    @Override
    public Map<Integer, List> topicQuestionHotWeek() {
        List<Question> list = dao.hotweek();
        List<Topic> topicList = new ArrayList<>();
        Map<Integer,List> map = new HashMap<>();
        for (int i=0;i<list.size();i++){
            topicList = topic_questionService.findTopicByQuestion(list.get(i).getId_question());
            map.put(list.get(i).getId_question(),topicList);
        }
        return map;
    }

    @Override
    public Map<Integer, Long> countAnswerHotMonth() {
        List<Question> hotMonth = dao.hotmonth();
        Long count ;
        Map<Integer,Long> mapHotMonth = new HashMap<>();
        for (int i =0; i<hotMonth.size();i++){
            count = answerDAO.count(hotMonth.get(i).getId_question());
            mapHotMonth.put(hotMonth.get(i).getId_question(),count);
        }
        return mapHotMonth;
    }

    @Override
    public List<Question> sortHotMonth() {
        Map<Integer,Long> mapQuestionMonth = new HashMap<>();
        List<Question> hotMonth = dao.hotmonth();
        Long countVoteUp;
        Long countAnswer;
        Long total;
        for(int i = 0; i<hotMonth.size();i++) {
            countVoteUp = vote_questionDAO.countUp(hotMonth.get(i).getId_question());
            countAnswer = answerDAO.count(hotMonth.get(i).getId_question());
            total = countVoteUp + countAnswer;
            mapQuestionMonth.put(hotMonth.get(i).getId_question(),total);
        }
        Map<Integer,Long> sortByHotMonth = sortByQuestion(mapQuestionMonth,false);
        List<Question> listQuestionHot = new ArrayList<>();
        Question question = new Question();
        Set set = sortByHotMonth.entrySet();
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry mentry = (Map.Entry) iterator.next();
            question = dao.findById((Integer) mentry.getKey());
            listQuestionHot.add(question);
        }

        return listQuestionHot;
    }

    @Override
    public Map<Integer, List> topicQuestionHotMonth() {
        List<Question> list = dao.hotmonth();
        List<Topic> topicList = new ArrayList<>();
        Map<Integer,List> map = new HashMap<>();
        for (int i=0;i<list.size();i++){
            topicList = topic_questionService.findTopicByQuestion(list.get(i).getId_question());
            map.put(list.get(i).getId_question(),topicList);
        }
        return map;
    }

    //sap xep map theo value giam dan
    private static Map<Integer, Long> sortByQuestion(Map<Integer, Long> unsortMap, final boolean order) {

        List<Map.Entry<Integer, Long>> list = new LinkedList<Map.Entry<Integer, Long>>(unsortMap.entrySet());

        // Sorting the list based on values
        Collections.sort(list, new Comparator<Map.Entry<Integer, Long>>() {
            public int compare(Map.Entry<Integer, Long> o1,
                               Map.Entry<Integer, Long> o2) {
                if (order) {
                    return o1.getValue().compareTo(o2.getValue());
                } else {
                    return o2.getValue().compareTo(o1.getValue());

                }
            }
        });

        // Maintaining insertion order with the help of LinkedList
        Map<Integer, Long> sortedMap = new LinkedHashMap<Integer, Long>();
        for (Map.Entry<Integer, Long> entry : list) {
            sortedMap.put(entry.getKey(), entry.getValue());
        }

        return sortedMap;
    }

}
