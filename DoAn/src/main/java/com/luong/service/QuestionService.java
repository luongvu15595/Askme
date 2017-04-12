package com.luong.service;

import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.model.User;

import java.util.List;

public interface QuestionService {
    public List<QuestionDTO> listQuestion();
    public QuestionDTO findById(int id);
    public void add(Question question, User user);
}
