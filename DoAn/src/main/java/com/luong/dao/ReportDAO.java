package com.luong.dao;

import com.luong.model.Report;

/**
 * Created by HP on 4/24/2017.
 */
public interface ReportDAO {
    public void add(Report report);
    public Report find(int idUser, int idQuestion);
}
