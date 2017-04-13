package com.luong.dao;

import com.luong.model.Answer;
import com.luong.model.Question;
import com.luong.model.Topic_Qestion;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Luong-PC on 4/4/2017.
 */
@Repository
@Transactional
public class Topic_QuestionDAOImpl implements Topic_QuestionDAO {
    @PersistenceContext
    private EntityManager em;
    @Override
    public void add(Topic_Qestion topic_qestion) {
        try {
            em.persist(topic_qestion);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<Topic_Qestion> findlistTQ(int id) {
        return em.createQuery("select t from Topic_Qestion t where t.topic.id= :id").setParameter("id",id).getResultList();
    }
    // lay ra list topic_question theo cau hoi
    @Override
    public List<Topic_Qestion> findListQuestion(int id) {
        return em.createQuery("select t from Topic_Qestion t where t.question.id_question= :id").setParameter("id",id).getResultList();
    }
}
