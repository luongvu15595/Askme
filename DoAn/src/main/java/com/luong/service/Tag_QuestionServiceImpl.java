package com.luong.service;

import com.luong.dao.TagDAO;
import com.luong.dao.Tag_QuestionDAO;
import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.model.Tag;
import com.luong.model.Tag_Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class Tag_QuestionServiceImpl implements Tag_QuestionService {
    @Autowired
    TagService tagService;
    @Autowired
    Tag_QuestionDAO tag_questionDAO;
    @Autowired
    TagDAO tagDAO;
    @Autowired
    QuestionService questionService;

    @Override
    public void add( List<String> listtag, Question question) {
        Tag_Question tagQuestion = new Tag_Question();
        Tag tag = new Tag();
        System.out.println(listtag.size());
        for (int i=0;i<listtag.size();i++) {
            System.out.println("1");
            tag = tagDAO.found(listtag.get(i));
            System.out.println("2");
            if (tag == null) {
                Tag tag1 = new Tag();
                tag1.setName(listtag.get(i));
                tagService.add(tag1);
            }
        }
        for (int i=0;i<listtag.size();i++) {
            tag = tagDAO.found(listtag.get(i));
            tagQuestion.setQuestion(question);
            tagQuestion.setTag(tag);
            tag_questionDAO.add(tagQuestion);
        }

    }

    @Override
    public List<Question> findQuestionByTag(int id) {
        List<Tag_Question> tq = tag_questionDAO.findlistTQ(id);
        List<Question> q = new ArrayList<Question>();
        for(int i = 0; i<tq.size();i++){
            q.add(tq.get(i).getQuestion());
        }
        return q;
    }
    // tra ve 1 list Tag theo cau hoi tuong ung
    @Override
    public List<Tag> findTagByQuestion(int id) {
        List<Tag_Question> tagQuestions = tag_questionDAO.findListQuestion(id);
        Tag tag = new Tag();
        List<Tag> tags = new ArrayList<>();
        for(int i = 0; i< tagQuestions.size(); i++){
            tag = tagDAO.findTag(tagQuestions.get(i).getTag().getId()) ;
            tags.add(tag);
        }
        return tags ;
    }
    //map cac cau hoi va tag tuong ung
    @Override
    public Map<Integer, List> tagsOfQuestion() {
        QuestionDTO questionDTO = new QuestionDTO();
        List<QuestionDTO> q = questionService.listQuestion();
        List<Tag> t = new ArrayList<>();
        Map<Integer,List> tq = new HashMap<>();
        int id;
        for (int i = 0 ; i<q.size();i++){
            questionDTO = q.get(i);
            id = questionDTO.getId_question();
            t = findTagByQuestion(id);
            tq.put(id,t);

        }
        return tq;
    }
}
