package com.luong.service;

import com.luong.model.Report;
import com.luong.model.User;

import java.util.List;

/**
 * Created by HP on 4/24/2017.
 */
public interface ReportService {
    public void add(User user, int idQuestion, String content);
    public List<Report> listReports();
}
