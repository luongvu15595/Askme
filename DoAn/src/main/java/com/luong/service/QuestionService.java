package com.luong.service;

import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.model.User;

import javax.jws.soap.SOAPBinding;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface QuestionService {
    public List<QuestionDTO> listQuestion();
    public QuestionDTO findById(int id);
    public void add(Question question, User user);
    public List<Question> search(String string);
    public void update(Question question);
    public void del(int id);
}
