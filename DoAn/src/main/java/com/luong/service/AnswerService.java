package com.luong.service;

import com.luong.model.Answer;
import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.model.User;

import java.util.List;
import java.util.Map;

public interface AnswerService {
    Map<Integer, Long> count();

    public Map<Integer, Long> countVoteUpAnswers(int idQuestion);
    public Map<Integer, Long> countVoteDownAnswers(int idQuestion);
    List<Answer> la();
    public Map<Integer,Map<String,Long> > voteAnswerData(User user,int idQuestion);
    public Answer add(Answer answer, int id,User user);
    public void del(int id);
    public List<Answer> listAnswerOfQuestion(int id);
    public void updateAnswer(Answer answer);

}
