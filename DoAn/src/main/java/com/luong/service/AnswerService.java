package com.luong.service;

import com.luong.model.Answer;
import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.model.User;

import java.util.List;
import java.util.Map;

public interface AnswerService {
    Map<Integer, Long> count();

    List<Answer> la();

    public void add(Answer answer, int id,User user);

    public List<Answer> listAnswerOfQuestion(int id);

}
