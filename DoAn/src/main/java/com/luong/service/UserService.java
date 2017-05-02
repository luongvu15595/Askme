package com.luong.service;

import com.luong.model.User;

import java.util.List;

public interface UserService {

    void save(User user);

    User findByEmail(String email);
    User findById(int id);
    List<User> listUser();
    public int isAdmin(User user);
}
