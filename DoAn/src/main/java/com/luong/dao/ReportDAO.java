package com.luong.dao;

import com.luong.model.Report;

import java.util.List;

/**
 * Created by HP on 4/24/2017.
 */
public interface ReportDAO {
    public void add(Report report);
    public Report find(int idUser, int idQuestion);
    public List<Report> listReports();
}
