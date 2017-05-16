package com.luong.service;

import com.luong.dao.QuestionDAO;
import com.luong.dao.ReportDAO;
import com.luong.model.Report;
import com.luong.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by HP on 4/24/2017.
 */
@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    ReportDAO reportDAO;
    @Autowired
    QuestionDAO questionDAO;


    @Override
    public void add(User user, int idQuestion, String content) {
        if(reportDAO.find(user.getId(),idQuestion) ==null) {
            Report report = new Report();
            report.setQuestion(questionDAO.findById(idQuestion));
            report.setContent(content);
            report.setUser(user);
            reportDAO.add(report);
        }
        else return;
    }

    @Override
    public List<Report> listReports() {
        return  reportDAO.listReports();
    }

    @Override
    public Report find(int id) {
        return reportDAO.find(id);
    }

    @Override
    public void update(Report report) {
        report.setStatus(1);
        reportDAO.update(report);
    }
}
