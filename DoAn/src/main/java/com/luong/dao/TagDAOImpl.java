package com.luong.dao;

import com.luong.model.Tag;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class TagDAOImpl implements TagDAO {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Tag found(String name) {
        try {
            Tag tag = (Tag) entityManager.createQuery("select t from Tag t where t.name = :name").setParameter("name", name).getSingleResult();
            return tag;
        }catch (Exception e){
            return null;
        }

    }

    @Override
    public void create(Tag t) {
        entityManager.persist(t);
        return;
    }

    @Override
    public List<Tag> listTag() {
        return entityManager.createQuery("select t from Tag t").getResultList();
    }

    @Override
    public Tag findTag(int id) {
        return entityManager.find(Tag.class,id);
    }

    @Override
    public void del(int idTag) {
        entityManager.createQuery("delete from Tag t where t.id= :id").setParameter("id", idTag).executeUpdate();
    }
}
