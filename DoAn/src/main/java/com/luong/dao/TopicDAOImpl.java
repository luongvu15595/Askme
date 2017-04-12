package com.luong.dao;

import com.luong.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
@Transactional
public class TopicDAOImpl implements TopicDAO {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Topic found(String name) {
        return (Topic) entityManager.createQuery("select t from Topic t where t.name = :name").setParameter("name", name).getSingleResult();
    }

    @Override
    public void create(Topic t) {
        entityManager.persist(t);
        return;
    }
}
