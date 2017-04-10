package com.luong.service;

import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;

import java.util.List;

/**
 * Created by HP on 3/30/2017.
 */
public interface QuestionService {
    public List<QuestionDTO> listQuestion();
    public QuestionDTO findById(int id);
    public void add(Question question);
}
