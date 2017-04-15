package com.luong.service;

import com.luong.dao.AnswerDAO;
import com.luong.dao.QuestionDAO;
import com.luong.dao.UserDAO;
import com.luong.dao.Vote_AnswerDAO;
import com.luong.model.Answer;
import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.model.User;
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
    @Autowired
    Vote_AnswerDAO vote_answerDAO;

    @Override
    public void add(Answer answer, int id, User user) {
        Question question = questionDAO.findById(id);
        answer.setTime(new Date());
        answer.setQuestion(question);
        answer.setUser(user);
        answerDAO.add(answer);
    }

    @Override
    public List<Answer> listAnswerOfQuestion(int id) {
        return answerDAO.listAnswerOfQuestion(id);
    }


    @Override
    public Map<Integer, Long> count() {
        Map<Integer, Long> mapCountAnswer = new TreeMap(Collections.reverseOrder());
        long c;
        QuestionDTO questionDTO = new QuestionDTO();
        List<QuestionDTO> lq = questionService.listQuestion();
        for (int i = 0; i < lq.size(); i++) {
            questionDTO = lq.get(i);
            c = (answerDAO.count(questionDTO.getId_question()));
            mapCountAnswer.put(questionDTO.getId_question(),c);
        }

        return mapCountAnswer;
    }

    @Override
    public Map<Integer, Long> countVoteUpAnswers(int idQuestion) {
        Map<Integer, Long> mapCountAnswer = new HashMap<>();
        List<Answer>  la = answerDAO.listAnswerOfQuestion(idQuestion);
        long c;
        for (int i = 0; i < la.size(); i++){
            Answer answer = new Answer();
            answer =la.get(i);
            c= vote_answerDAO.countUp(answer.getId());
            mapCountAnswer.put(answer.getId(),c);
        }

        return mapCountAnswer;
    }

    @Override
    public Map<Integer, Long> countVoteDownAnswers(int idQuestion) {
        Map<Integer, Long> mapCountAnswer = new HashMap<>();
        List<Answer>  la = answerDAO.listAnswerOfQuestion(idQuestion);
        long c;
        for (int i = 0; i < la.size(); i++){
            Answer answer = new Answer();
            answer =la.get(i);
            c= vote_answerDAO.countDown(answer.getId());
            mapCountAnswer.put(answer.getId(),c);
        }

        return mapCountAnswer;
    }


    @Override
    public List<Answer> la() {
        return answerDAO.la();
    }
}
