package com.luong.service;

import com.luong.dao.AnswerDAO;
import com.luong.dao.QuestionDAO;
import com.luong.dao.UserDAO;
import com.luong.dao.Vote_AnswerDAO;
import com.luong.model.Answer;
import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.model.User;
import com.luong.model.Vote_Answer;
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
    public Answer add(Answer answer, int id, User user) {
        Question question = questionDAO.findById(id);
        answer.setTime(new Date());
        answer.setQuestion(question);
        answer.setUser(user);
        answerDAO.add(answer);
        return answerDAO.listAnswerOfQuestion(id).get(answerDAO.listAnswerOfQuestion(id).size() -1);
    }


    @Override
    public void del(int id) {
        answerDAO.del(id);
    }

    @Override
    public List<Answer> listAnswerOfQuestion(int id) {
        return answerDAO.listAnswerOfQuestion(id);
    }

    @Override
    public void updateAnswer(Answer answer) {
        Answer answer1 =answerDAO.findById(answer.getId());
        answer1.setContent(answer.getContent());
        answerDAO.updateAnswer(answer1);
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
    public Map<Integer, Map<String, Long>> voteAnswerData(User user,int idQuestion) {
        Map<Integer, Map<String, Long>> integerMapMap = new HashMap<>();
        List<Answer> la = answerDAO.listAnswerOfQuestion(idQuestion);

        for (int i = 0; i < la.size(); i++) {
            Answer answer = new Answer();
            answer = la.get(i);
            Map<String, Long> map = new HashMap<>();
            map.put("countdown",vote_answerDAO.countDown(answer.getId()));
            map.put("countup",vote_answerDAO.countUp(answer.getId()));

            if (user != null){
                Vote_Answer vote_answer = vote_answerDAO.find(user.getId(), answer.getId());
                if (vote_answer != null ){
                    if (vote_answer.getDownvote() == 1 && vote_answer.getUpvote() ==0)  map.put("voted", (long) 2);
                    if (vote_answer.getDownvote() == 0 && vote_answer.getUpvote() ==1)  map.put("voted", (long) 1);
                }
                else map.put("voted", (long) 0);
            }
            else map.put("voted", (long) 0);
            integerMapMap.put(answer.getId(),map);
        }
        return integerMapMap;
    }



    @Override
    public List<Answer> la() {
        return answerDAO.la();
    }
}
