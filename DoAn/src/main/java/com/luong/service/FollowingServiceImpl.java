package com.luong.service;

import com.luong.dao.FollowedDAO;
import com.luong.dao.FollowingDAO;
import com.luong.dao.UserDAO;
import com.luong.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Luong-PC on 4/24/2017.
 */
@Service
public class FollowingServiceImpl implements FollowingService {
    @Autowired
    FollowingDAO followingDAO;
    @Autowired
    UserDAO userDAO;
    @Autowired
    FollowedDAO followedDAO;
    @Override
    public List<Following> getAll() {
        return followingDAO.getAll() ;
    }

    @Override
    public void add(int user_followed,int user_following) {
        Following following = new Following();
        Followed followed = new Followed();
        followed.setUser_followed(userDAO.findById(user_following));
        followed.setUser_following(userDAO.findById(user_followed));
        following.setUser_followed(userDAO.findById(user_followed));
        following.setUser_following(userDAO.findById(user_following));
        followingDAO.add(following);
        followedDAO.add(followed);
    }

    @Override
    public void destroy(int user_followed, int user_following) {
        Following following = new Following();
        Followed followed = new Followed();
        following = find(user_followed,user_following);
        followed = findFollowed(user_followed,user_following);
        followingDAO.Destroy(following);
        followedDAO.Destroy(followed);
    }

    @Override
    public Following find(int user_followed, int user_following) {
        return followingDAO.find(user_followed,user_following);
    }

    @Override
    public Followed findFollowed(int user_following, int user_followed) {
        return followedDAO.findfollowed(user_following,user_followed);
    }

    @Override
    public Map<Integer, Map<String, Long>> followingUserData(User user) {
        Map<Integer, Map<String, Long>> integerMapMap = new HashMap<>();
        List<User> lu = userDAO.listUser();

        for (int i = 0; i < lu.size(); i++) {
            User user1 = new User();
            user1 = lu.get(i);
            Map<String, Long> map = new HashMap<>();
            if ( user != null){
                Following following = followingDAO.find(user.getId(),user1.getId());
                if (following != null ){
                    map.put("following", (long) 1);
                }
                else map.put("following", (long) 0);
            }

            integerMapMap.put(user1.getId(),map);
        }
        return integerMapMap;
    }


}
