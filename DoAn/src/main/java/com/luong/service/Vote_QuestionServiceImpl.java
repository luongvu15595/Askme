package com.luong.service;

import com.luong.dao.QuestionDAO;
import com.luong.dao.UserDAO;
import com.luong.dao.Vote_QuestionDAO;
import com.luong.model.User;
import com.luong.model.Vote_Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by HP on 4/10/2017.
 */
@Service
public class Vote_QuestionServiceImpl implements Vote_QuestionService {
    @Autowired
    Vote_QuestionDAO vote_questionDAO;
    @Autowired
    UserDAO userDAO;
    @Autowired
    QuestionDAO questionDAO;

    @Override
    public Long countUp(int idQuestion) {
        return vote_questionDAO.countUp(idQuestion);
    }

    @Override
    public Long countDown(int idQuestion) {
        return vote_questionDAO.countDown(idQuestion);
    }

    @Override
    public void up_Vote_Question(int idUser,int idQuestion) {
        Vote_Question vote_question1 = vote_questionDAO.find(idUser,idQuestion);
        if (vote_question1 == null) {
            System.out.println("vao 1");
        Vote_Question vote_question = new Vote_Question();
        vote_question.setUser(userDAO.findById(idUser));
        vote_question.setQuestion(questionDAO.findById(idQuestion));
        vote_question.setUpvote(1);
        vote_question.setDownvote(0);
        vote_questionDAO.up_Vote_Question(vote_question);
        }
        else
        {
            if (vote_question1.getUpvote() == 1 ) return;
            else {
                vote_question1.setUpvote(1);
                vote_question1.setDownvote(0);
                vote_questionDAO.update_Vote_Question(vote_question1);
            }
        }


    }

    @Override
    public void down_Vote_Question(int idUser,int idQuestion) {
        Vote_Question vote_question1 = vote_questionDAO.find(idUser, idQuestion);
        if (vote_question1 == null) {

            Vote_Question vote_question = new Vote_Question();
            vote_question.setUser(userDAO.findById(idUser));
            vote_question.setQuestion(questionDAO.findById(idQuestion));
            vote_question.setUpvote(0);
            vote_question.setDownvote(1);
            vote_questionDAO.down_Vote_Question(vote_question);
        }
        else
        {
            if (vote_question1.getDownvote() == 1 ) return;
            else {
                vote_question1.setUpvote(0);
                vote_question1.setDownvote(1);
                vote_questionDAO.update_Vote_Question(vote_question1);
            }

        }
    }

    @Override
    public Vote_Question find(User user, int idQuestion) {
        return vote_questionDAO.find(user.getId(), idQuestion);
    }
}
