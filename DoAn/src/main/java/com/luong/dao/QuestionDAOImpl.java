package com.luong.dao;

import com.luong.model.Question;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Date;
import java.util.List;

/**
 * Created by HP on 3/30/2017.
 */
@Repository
@Transactional
public class QuestionDAOImpl implements QuestionDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Question> listQuestion() {
        return em.createQuery("select q from Question q", Question.class).getResultList();
    }

    @Override
    public Question findById(int id) {
        Question q = em.find(Question.class,id);
        return  q;
        //  return (Question) em.createQuery("select q from Question q where q.id_question= :id").setParameter("id",id).getSingleResult();
    }


    @Override
    public void add(Question question) {

        try {
            em.persist(question);
        } catch (Exception ex) {
            ex.printStackTrace();
        }


    }
}
