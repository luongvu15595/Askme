package com.luong.service;
import com.luong.dao.AnswerDAO;
import com.luong.dao.QuestionDAO;
import com.luong.dao.UserDAO;
import com.luong.model.Answer;
import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by Luong-PC on 4/3/2017.
 */
@Service
public class AnswerServiceImpl implements AnswerService {
    @Autowired
    AnswerDAO answerDAO;
    @Autowired
    QuestionService questionService;
    @Autowired
    QuestionDAO questionDAO;
    @Autowired
    UserDAO userDAO;

    @Override
    public void add(Answer answer, int id) {
        Question question =questionDAO.findById(id);
        answer.setTime(new Date());
        answer.setQuestion(question);
        answer.setUser(userDAO.findById(4));
        answerDAO.add(answer);
    }

    @Override
    public List<Answer> listAnswerOfQuestion(int id) {
        return answerDAO.listAnswerOfQuestion(id);
    }



    @Override
    public Map<QuestionDTO, Long> count() {
        Map<QuestionDTO,Long> mapCountAnswer = new HashMap<>();
        long c;
        QuestionDTO q = new QuestionDTO();
        List<QuestionDTO> lq = questionService.listQuestion();
        for(int i=0; i<lq.size();i++){
            q = lq.get(i);
            c = (answerDAO.count( q.getId_question()));
            mapCountAnswer.put(q,c);
        }
        return mapCountAnswer;
    }

    @Override
    public List<Answer> la() {
        return answerDAO.la();
    }
}
