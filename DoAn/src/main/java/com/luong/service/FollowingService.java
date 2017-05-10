package com.luong.service;

import com.luong.model.Followed;
import com.luong.model.Following;
import com.luong.model.User;

import java.util.List;
import java.util.Map;

/**
 * Created by Luong-PC on 4/24/2017.
 */
public interface FollowingService {
    List<Following> getAll();
    void add(int user_followed,int user_following);
    Following find(int user_followed,int user_following);
    Followed findFollowed(int user_following,int user_followed);
    public Map<Integer, Map<String, Long>> followingUserData(User user);
    void destroy(int user_followed,int user_following);
}
