package com.luong.dao;

import com.luong.model.Following;
import com.luong.model.User;

import java.util.List;

/**
 * Created by Luong-PC on 4/24/2017.
 */
public interface FollowingDAO {
    public List<Following> getAll();
   public void add(Following following);
    public Following find(int user_followed,int user_following);
    public void Destroy(Following following);
    public List<User> findfollowing(int id);
}
