package com.luong.service;

import com.luong.model.Question;
import com.luong.model.Tag;

import java.util.List;
import java.util.Map;

public interface Tag_QuestionService {
    public void add(List<String> listtag, Question question);
    public List<Question> findQuestionByTag(int id);
    public List<Tag> findTagByQuestion(int id);
    public Map<Integer,List> tagsOfQuestion();
}
