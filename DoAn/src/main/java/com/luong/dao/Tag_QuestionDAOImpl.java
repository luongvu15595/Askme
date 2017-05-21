package com.luong.dao;

import com.luong.model.Tag_Question;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Luong-PC on 4/4/2017.
 */
@Repository
@Transactional
public class Tag_QuestionDAOImpl implements Tag_QuestionDAO {
    @PersistenceContext
    private EntityManager em;
    @Override
    public void add(Tag_Question tagQuestion) {
        em.persist(tagQuestion);
    }

    @Override
    public List<Tag_Question> findlistTQ(int id) {
        return em.createQuery("select t from Tag_Question t where t.tag.id= :id").setParameter("id",id).getResultList();
    }
    // lay ra list tag_question theo cau hoi
    @Override
    public List<Tag_Question> findListQuestion(int id) {
        return em.createQuery("select t from Tag_Question t where t.question.id_question= :id").setParameter("id",id).getResultList();
    }
}
