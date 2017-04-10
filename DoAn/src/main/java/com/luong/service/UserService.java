package com.luong.service;

import com.luong.model.User;

/**
 * Created by Luong-PC on 4/8/2017.
 */
public interface UserService {


    void save(User user);

    User findByEmail(String email);

}
