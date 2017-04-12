package com.luong.dao;

import com.luong.model.Vote_Question;

/**
 * Created by HP on 4/10/2017.
 */
public interface Vote_QuestionDAO {
    public void up_Vote_Question(Vote_Question vote_question);
    public void update_Vote_Question(Vote_Question vote_question);
    public void down_Vote_Question(Vote_Question vote_question);
    public Vote_Question find(int idUser, int idQuestion);
}
