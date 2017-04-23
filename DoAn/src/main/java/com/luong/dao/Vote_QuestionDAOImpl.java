package com.luong.dao;

import com.luong.model.Vote_Question;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by HP on 4/10/2017.
 */
@Repository
@Transactional
public class Vote_QuestionDAOImpl implements Vote_QuestionDAO {
    @PersistenceContext
    EntityManager em;


    @Override
    public void up_Vote_Question(Vote_Question vote_question) {
        em.persist(vote_question);
    }

    @Override
    public void down_Vote_Question(Vote_Question vote_question) {
        em.persist(vote_question);
    }

    @Override
    public Vote_Question find(int idUser,int idQuestion) {
        Vote_Question vote_question = new Vote_Question();
        try {
               vote_question=   em.createQuery("SELECT q FROM Vote_Question q " +
                                                        "WHERE q.user.id = ?1 " +
                                                        "AND q.question.id_question = ?2",Vote_Question.class)
                                                        .setParameter(1,idUser)
                                                        .setParameter(2,idQuestion).getSingleResult();

            return vote_question;

        }
        catch (Exception e){

            e.printStackTrace();
            return  null;
        }




    }

    @Override
    public Long countUp(int id) {
        return (Long) em.createQuery("select count(a.upvote) from Vote_Question a where a.question.id_question = :id and a.upvote =1")
                .setParameter("id", id).getSingleResult();
    }

    @Override
    public Long countDown(int id) {
        return (Long) em.createQuery("select count(a.downvote) from Vote_Question a where a.question.id_question = :id and a.downvote =1")
                .setParameter("id", id).getSingleResult();
    }

    @Override
    public void update_Vote_Question(Vote_Question vote_question) {
      //  Vote_Question vote_question = em.find(Vote_Question)
     //   em.getTransaction().begin();
        em.merge(vote_question);
      //  em.getTransaction().commit();

    }
}
