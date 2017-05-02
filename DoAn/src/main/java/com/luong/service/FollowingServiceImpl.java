package com.luong.service;

import com.luong.dao.FollowingDAO;
import com.luong.dao.UserDAO;
import com.luong.model.Answer;
import com.luong.model.Following;
import com.luong.model.User;
import com.luong.model.Vote_Answer;
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
    @Override
    public List<Following> getAll() {
        return followingDAO.getAll() ;
    }

    @Override
    public void add(int user_followed,int user_following) {
    Following following1 = followingDAO.find(user_followed,user_following);
        Following following = new Following();
        following.setUser_followed(userDAO.findById(user_followed));
        following.setUser_following(userDAO.findById(user_following));
        followingDAO.add(following);
    }

    @Override
    public void destroy(int user_followed, int user_following) {
        Following following = new Following();
        following = find(user_followed,user_following);
        System.out.println("1");
        followingDAO.Destroy(following);
    }

    @Override
    public Following find(int user_followed, int user_following) {
        return followingDAO.find(user_followed,user_following);
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
