package com.luong.service;

import com.luong.dao.AnswerDAO;
import com.luong.dao.UserDAO;
import com.luong.dao.Vote_AnswerDAO;
import com.luong.model.Vote_Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by HP on 4/11/2017.
 */
@Service
public class Vote_AnswerServiceImpl implements Vote_AnswerService {

    @Autowired
    Vote_AnswerDAO vote_answerDAO;
    @Autowired
    UserDAO userDAO;
    @Autowired
    AnswerDAO answerDAO;

    @Override
    public Long countUp(int idAnswer) {
        return vote_answerDAO.countUp(idAnswer);
    }

    @Override
    public Long countDown(int idAnswer) {
        return vote_answerDAO.countDown(idAnswer);
    }

    @Override
    public void up_Vote_Answer(int idUser, int idAnswer) {
        Vote_Answer vote_answer1 = vote_answerDAO.find(idUser,idAnswer);
        if (vote_answer1 == null){
            Vote_Answer vote_answer = new Vote_Answer();
            vote_answer.setUser(userDAO.findById(idUser));
            vote_answer.setAnswer(answerDAO.findById(idAnswer));
            vote_answer.setUpvote(1);
            vote_answer.setDownvote(0);
            vote_answerDAO.up_Vote_Answer(vote_answer);
        }
        else {
            if (vote_answer1.getUpvote() ==1 )return;
            else {
            vote_answer1.setUpvote(1);
            vote_answer1.setDownvote(0);
            vote_answerDAO.update_Vote_Answer(vote_answer1);
            }
        }
    }

    @Override
    public void down_Vote_Answer(int idUser, int idAnswer) {
        Vote_Answer vote_answer1 = vote_answerDAO.find(idUser,idAnswer);
        if (vote_answer1 == null){
            Vote_Answer vote_answer = new Vote_Answer();
            vote_answer.setUser(userDAO.findById(idUser));
            vote_answer.setAnswer(answerDAO.findById(idAnswer));
            vote_answer.setUpvote(0);
            vote_answer.setDownvote(1);

            vote_answerDAO.up_Vote_Answer(vote_answer);
        }
        else {
            if (vote_answer1.getDownvote() ==1 )return;
            else {
                vote_answer1.setUpvote(0);
                vote_answer1.setDownvote(1);
                vote_answerDAO.update_Vote_Answer(vote_answer1);
            }
        }
    }

    @Override
    public Vote_Answer find(int idUser, int idAnswer) {
        return vote_answerDAO.find(idUser,idAnswer);
    }
}
