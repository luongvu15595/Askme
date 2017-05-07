package com.luong.dao;

import com.luong.model.Question;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
        return em.createQuery("select q from Question q ORDER BY q.time DESC", Question.class).getResultList();
    }

    @Override
    public Question findById(int id) {
        Question q = em.find(Question.class, id);
        return q;
    }


    @Override
    public void add(Question question) {

        try {
            em.persist(question);
        } catch (Exception ex) {
            ex.printStackTrace();
        }


    }

    @Override
    public List<Question> search(String string) {
        try{
            List<Question> listquestion= em.createQuery("select q from Question q where q.title like :string ORDER BY q.time DESC").setParameter("string","%"+string+"%").getResultList();
          return listquestion;
        }catch (Exception e){
            return null;
        }

    }

    //28-4
    @Override
    public void del(int id) {
        em.createQuery("delete from Question q where q.id= :id").setParameter("id", id).executeUpdate();
    }

    @Override
    public List<Question> hotweek() {
        String sql ="select * from questions having datediff (curdate(),time)<=7";
        return em.createNativeQuery(sql,Question.class).getResultList();
    }

    @Override
    public List<Question> hotmonth() {
        String sql ="select * from questions having datediff (curdate(),time)<=30";
        return em.createNativeQuery(sql,Question.class).getResultList();
    }

    @Override
    public void update(Question question) {
        em.merge(question);
    }
}
