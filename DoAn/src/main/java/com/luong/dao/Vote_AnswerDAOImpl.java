package com.luong.dao;

import com.luong.model.Vote_Answer;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by HP on 4/11/2017.
 */
@Repository
@Transactional
public class Vote_AnswerDAOImpl implements Vote_AnswerDAO{
    @PersistenceContext
    EntityManager em;

    @Override
    public void up_Vote_Answer(Vote_Answer vote_answer) {
        em.persist(vote_answer);
    }

    @Override
    public void down_Vote_Answer(Vote_Answer vote_answer) {
        em.persist(vote_answer);
    }

    @Override
    public void update_Vote_Answer(Vote_Answer vote_answer) {
        em.merge(vote_answer);
    }

    @Override
    public Vote_Answer find(int idUser, int idAnswer) {
        Vote_Answer vote_answer = new Vote_Answer();
        try {
            vote_answer=   em.createQuery("SELECT q FROM Vote_Answer q " +
                    "WHERE q.user.id = ?1 " +
                    "AND q.answer.id = ?2",Vote_Answer.class)
                    .setParameter(1,idUser)
                    .setParameter(2,idAnswer).getSingleResult();
            System.out.println(idUser);
            System.out.println(String.valueOf(idAnswer));
            System.out.printf("finanswer");
            System.out.println(vote_answer);
            return vote_answer;

        }
        catch (Exception e){
            e.printStackTrace();
            return  null;
        }
    }

}
