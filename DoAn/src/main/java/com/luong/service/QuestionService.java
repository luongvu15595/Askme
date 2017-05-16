package com.luong.service;

import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.model.Topic;
import com.luong.model.User;

import javax.jws.soap.SOAPBinding;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface QuestionService {
    public List<QuestionDTO> listQuestion();
    public QuestionDTO findById(int id);
    public Question add(Question question, User user);
    public List<Question> search(String string);
    public Map<Integer,Long> countanswerquestionsearch(String string);
    public Map<Integer,List> topicquestionsearch(String string);
    public Map<Integer,Long> countUpvotequestionsearch(String string);
    public void update(Question question);
    public void del(int id);
    //6/5
    public Map<Integer,Long> countanswerquestionbytopic(int id);
    public Map<Integer,Long> countUpVotequestionbytopic(int id);
    public Map<Integer,List> listtopicbytopic(int id);
    public Map<Integer,Long> countUpVote();
    public Map<Integer,Long> countUpVoteHotWeek();
    public Map<Integer,Long> countAnswerHotWeek();
    public List<Question> sortHotWeek();
    public Map<Integer,List> topicQuestionHotWeek();
    public Map<Integer,Long> countUpVoteHotMonth();
    public Map<Integer,Long> countAnswerHotMonth();
    public List<Question> sortHotMonth();
    public Map<Integer,List> topicQuestionHotMonth();
    //15/5
    public Integer countquestion();

    public Map<Integer,Long> countquestionUser();
    public List<User> listSortUserQuetions();
    public Map<Integer,Long> countAnswerUser();
    public List<User> listSortUserAnswers();

    public Map<Integer,Long> countanswerquestionbyuser(int id);
    public Map<Integer,List> topicQuestionbyuser(int id);
    public Map<Integer,Long> countUpVoteQuestionUser(int id );
}
