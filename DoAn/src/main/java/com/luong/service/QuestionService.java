package com.luong.service;

import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.model.User;

import javax.jws.soap.SOAPBinding;
import java.util.Date;
import java.util.List;

public interface QuestionService {
    public List<QuestionDTO> listQuestion();
    public QuestionDTO findById(int id);
    public void add(Question question, User user);
    public List<QuestionDTO> search(String string);
    public void remote(int id);
    public void update(Question question, User user, Date date);
}
