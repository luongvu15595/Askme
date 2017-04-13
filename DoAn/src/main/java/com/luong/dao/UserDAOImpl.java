package com.luong.dao;

import com.luong.model.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {
    @PersistenceContext
    private EntityManager em;

    @Override
    public User findByEmail(String email) {
        User user = new User();
        try {
            user = (User) em.createQuery("select u from User u where u.email = :email").setParameter("email", email).getSingleResult();
            return user;
        } catch (Exception e) {
            return null;
        }

    }

    @Override
    public User findById(int id) {
        return (User) em.createQuery("select q from User q where q.id= :id").setParameter("id",id).getSingleResult();
    }


    @Override
    public void save(User user) {
        em.persist(user);
    }

    @Override
    public List<User> listUser() {
        return em.createQuery("select u from User u").getResultList();
    }
}
