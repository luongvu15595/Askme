package com.luong.dao;

import com.luong.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class TopicDAOImpl implements TopicDAO {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Topic found(String name) {
        try {
            Topic topic = (Topic) entityManager.createQuery("select t from Topic t where t.name = :name").setParameter("name", name).getSingleResult();
            return topic;
        }catch (Exception e){
            return null;
        }

    }

    @Override
    public void create(Topic t) {
        entityManager.persist(t);
        return;
    }

    @Override
    public List<Topic> listTopic() {
        return entityManager.createQuery("select t from Topic t").getResultList();
    }

    @Override
    public Topic findTopic(int id) {
        return entityManager.find(Topic.class,id);
    }

    @Override
    public void del(int idTopic) {
        entityManager.createQuery("delete from Topic t where t.id= :id").setParameter("id", idTopic).executeUpdate();
    }
}
