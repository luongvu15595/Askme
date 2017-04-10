package com.luong.dao;

import com.luong.model.Topic_Qestion;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
