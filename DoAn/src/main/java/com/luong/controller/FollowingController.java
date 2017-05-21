package com.luong.controller;

import com.luong.model.Following;
import com.luong.model.User;
import com.luong.service.FollowingService;
import com.luong.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;
import java.util.List;
import java.util.Map;

/**
 * Created by Luong-PC on 4/24/2017.
 */
@Controller
public class FollowingController {




    @Autowired
    FollowingService followingService;
    @Autowired
    UserService userService;

    //lay ra 1 list tag
    @RequestMapping(value = "/listfolling",method = RequestMethod.GET,headers = "Accept=Application/json")
    @ResponseBody
    public List<Following> gettag(){
        return followingService.getAll();
    }

    @RequestMapping(value = "/following/{id}", method= RequestMethod.POST)
    @ResponseBody
    public void following(@PathVariable(value="id") int  id_userfollowing,Principal principal) {

            String name = principal.getName();
            User user = userService.findByEmail(name);
            followingService.add(user.getId(), id_userfollowing);

    }

    @RequestMapping(value = "/destroyfollowing/{id}", method= RequestMethod.DELETE)
    @ResponseBody
    public void destroyfollowing(@PathVariable(value="id") int  id_userfollowing,Principal principal) {
        if (principal != null) {
            String name = principal.getName();
            User user = userService.findByEmail(name);
            followingService.destroy(user.getId(), id_userfollowing);
        }
    }

    @RequestMapping(value = "/getmapfollowing", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer, Map<String, Long>> getmapfollowing( Principal principal) {
        User user = new User();
        String email = principal.getName();
        user = userService.findByEmail(email);
        return followingService.followingUserData( user);
    }

}