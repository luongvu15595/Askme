package com.luong.service;

import com.luong.dao.RoleDAO;
import com.luong.dao.UserDAO;
import com.luong.model.Role;
import com.luong.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Luong-PC on 4/8/2017.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userRepository;
    @Autowired
    private RoleDAO roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Override
    public void save(User user) {
       user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
       List<Role> roles = new ArrayList<Role>();
       roles.add(roleRepository.findByName("ROLE_USER"));
       user.setRoles(roles);
       userRepository.save(user);


    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public User findById(int id) {

        return userRepository.findById(id);
    }

    @Override
    public List<User> listUser() {
        List<User> list =userRepository.listUser();
//        System.out.println(list.size());
        for(int i = list.size()-1;i>=0; i-- ){
            if (isAdmin(list.get(i)) == 1) {
                  list.remove(list.get(i));
            }
        }
        return list;
    }

    @Override
    public int isAdmin(User user) {
        for (Role role : user.getRoles()){
            if (role.getName().equals("ROLE_ADMIN")) return 1;
        }
        return 0;
    }

    @Override
    public void updatePassword(User user) {
        User user1 = userRepository.findById(user.getId());
        user1.setPassword(user.getPassword());
        userRepository.update(user1);
    }

    @Override
    public void del(int idUser) {
        userRepository.del(idUser);
    }
}
