package com.luong.dao;

import com.luong.model.Followed;
import com.luong.model.Following;

/**
 * Created by Luong-PC on 5/5/2017.
 */
public interface FollowedDAO {
    public void add(Followed followed);
    public Followed findfollowed(int user_following,int user_followed);
    public void Destroy(Followed followed);
}
