package com.luong.dao;

import com.luong.model.User;

import java.util.List;

public interface UserDAO {
    User findByEmail(String email);

    User findById(int id);

    void save(User user);
    List<User> listUser();
    public void update(User user);
    public void del(int  id);
}
