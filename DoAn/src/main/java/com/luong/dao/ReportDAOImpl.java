package com.luong.dao;

import com.luong.model.Report;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by HP on 4/24/2017.
 */
@Repository
@Transactional
public class ReportDAOImpl implements ReportDAO {
    @PersistenceContext
    EntityManager em;

    @Override
    public void add(Report report) {
        em.persist(report);
    }

    @Override
    public Report find(int idUser, int idQuestion) {
        Report report = new Report();
        try {
            report=   em.createQuery("SELECT q FROM Report q " +
                    "WHERE q.user.id = ?1 " +
                    "AND q.question.id_question = ?2",Report.class)
                    .setParameter(1,idUser)
                    .setParameter(2,idQuestion).getSingleResult();

            return report;

        }
        catch (Exception e){

            e.printStackTrace();
            return  null;
        }
    }
}
