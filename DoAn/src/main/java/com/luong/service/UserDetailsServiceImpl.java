package com.luong.service;

import com.luong.dao.UserDAO;
import com.luong.dao.UserDAOImpl;
import com.luong.model.Role;
import com.luong.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Luong-PC on 4/8/2017.
 */
@Service("userDetailsServiceImpl")
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserDAO userDao;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = new User();
        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
        user = userDao.findByEmail(email);
        for (Role role : user.getRoles()) {
                System.out.println("role process: " + role);
                grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
            }
        return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), grantedAuthorities);
    }

    public UserDAO getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDAO userDao) {
        this.userDao = userDao;
    }
}
