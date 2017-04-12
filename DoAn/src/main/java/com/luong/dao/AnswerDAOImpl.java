package com.luong.dao;

import com.luong.model.Answer;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;


@Repository
@Transactional
public class AnswerDAOImpl implements AnswerDAO {
    @PersistenceContext
    private EntityManager em;

    @Override
    public Long count(int id) {
        return (Long) em.createQuery("select count(a) from Answer a where a.question.id_question = :id").setParameter("id", id).getSingleResult();
    }

    @Override
    public List<Answer> la() {
        return em.createQuery("select a from Answer a", Answer.class).getResultList();
    }

    @Override
    public List<Answer> listAnswerOfQuestion(int id) {
        List<Answer> list = em.createQuery("select q from Answer q where q.question.id_question= :id").setParameter("id", id).getResultList();
        return list;
    }

    @Override
    public void add(Answer answer) {
        em.persist(answer);
    }



    @Override
    public Answer findById(int id) {
        return em.find(Answer.class,id);
    }


}
