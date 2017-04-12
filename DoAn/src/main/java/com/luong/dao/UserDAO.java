package com.luong.dao;

import com.luong.model.User;

public interface UserDAO {
    User findByEmail(String email);

    User findById(int id);

    void save(User user);
}
