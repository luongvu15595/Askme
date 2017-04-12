package com.luong.service;

import com.luong.model.User;

public interface UserService {

    void save(User user);

    User findByEmail(String email);
}
