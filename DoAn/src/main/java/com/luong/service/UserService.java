package com.luong.service;

import com.luong.model.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    void save(User user);

    User findByEmail(String email);
    User findById(int id);
    public Integer countListUser();
    List<User> listUser();
    public int isAdmin(User user);
    public void updatePassword(User user);
    public void updateName(User user);
    public void del(int idUser);
    public Map<Integer,Long> countfollower();
    public List<User> sortUserbyfollow();
}
