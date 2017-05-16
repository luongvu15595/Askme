package com.luong.dao;

import com.luong.model.Followed;
import com.luong.model.Following;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by Luong-PC on 5/5/2017.
 */
@Repository
@Transactional
public class FollowedDAOImpl implements FollowedDAO {
    @PersistenceContext
    private EntityManager em;
    @Override
    public void add(Followed followed) {
        em.persist(followed);
    }

    @Override
    public Followed findfollowed(int user_following, int user_followed) {
        Followed followed1 = new Followed();
        try{
            followed1 = em.createQuery("SELECT f FROM Followed f " +
                    "WHERE f.user_following.id = ?1 " +
                    "AND f.user_followed.id = ?2",Followed.class)
                    .setParameter(1,user_following)
                    .setParameter(2,user_followed).getSingleResult();
            return followed1;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void Destroy(Followed followed) {
        int id = followed.getId_followed();
        em.createQuery("DELETE FROM Followed f WHERE f.id_followed= :id ").setParameter("id",id).executeUpdate();
    }

    @Override
    public Long countfollow(int id) {
        System.out.println("8");
        try {
            Long t = (Long) em.createQuery("select count(a) from Followed a where a.user_followed.id = :id").setParameter("id", id).getSingleResult();
            System.out.println("9");
            return t;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

}
