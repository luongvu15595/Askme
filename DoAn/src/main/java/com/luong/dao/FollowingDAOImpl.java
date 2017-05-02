package com.luong.dao;

import com.luong.model.Following;
import com.luong.model.Vote_Answer;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Luong-PC on 4/24/2017.
 */
@Repository
@Transactional
public class FollowingDAOImpl implements FollowingDAO {
    @PersistenceContext
    private EntityManager em;
    @Override
    public List<Following> getAll() {
        return em.createQuery("select f from Following f",Following.class).getResultList();
    }

    @Override
    public void add(Following following) {
        em.persist(following);
    }

    @Override
    public Following find(int user_followed, int user_following) {
        Following following = new Following();
        try{
            following = em.createQuery("SELECT f FROM Following f " +
                    "WHERE f.user_followed.id = ?1 " +
                    "AND f.user_following.id = ?2",Following.class)
                    .setParameter(1,user_followed)
                    .setParameter(2,user_following).getSingleResult();
            return following;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void Destroy(Following following) {
        int id = following.getId_following();
        System.out.println("2");
        em.createQuery("DELETE FROM Following f WHERE f.id_following= :id ").setParameter("id",id).executeUpdate();
        System.out.println("3");
    }


}
