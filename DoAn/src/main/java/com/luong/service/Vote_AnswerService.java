package com.luong.service;

import com.luong.model.Vote_Answer;

/**
 * Created by HP on 4/11/2017.
 */
public interface Vote_AnswerService {
    public Long countUp(int idAnswer);
    public Long countDown(int idAnswer);
    public void up_Vote_Answer(int idUser, int idAnswer);
    public void down_Vote_Answer(int idUser, int idAnswer);
    public Vote_Answer find(int idUser, int idAnswer);
}
