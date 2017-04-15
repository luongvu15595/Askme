package com.luong.service;

import com.luong.model.Vote_Question;

/**
 * Created by HP on 4/10/2017.
 */
public interface Vote_QuestionService {
    public Long countUp(int idQuestion);
    public Long countDown(int idQuestion);
    public void up_Vote_Question(int idUser, int idQuestion);
    public void down_Vote_Question(int idUser, int idQuestion);
    public Vote_Question find(int idUser, int idQuestion);
}
