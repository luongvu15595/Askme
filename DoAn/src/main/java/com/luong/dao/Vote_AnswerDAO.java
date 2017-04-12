package com.luong.dao;

import com.luong.model.Vote_Answer;

/**
 * Created by HP on 4/11/2017.
 */
public interface Vote_AnswerDAO {
    public  void up_Vote_Answer(Vote_Answer vote_answer);
    public  void down_Vote_Answer(Vote_Answer vote_answer);
    public  void update_Vote_Answer(Vote_Answer vote_answer);
    public  Vote_Answer find(int idUser, int idAnswer);
}
