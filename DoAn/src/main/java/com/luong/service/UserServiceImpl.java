package com.luong.service;

import com.luong.dao.FollowedDAO;
import com.luong.dao.RoleDAO;
import com.luong.dao.UserDAO;
import com.luong.model.Role;
import com.luong.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;

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
    @Autowired
    private FollowedDAO followedDAO;
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
    public Integer countListUser() {
        List<User> users = listUser();
        return users.size();
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
    public void updateName(User user) {
        User user1 = userRepository.findById(user.getId());
        user1.setName(user.getName());
        userRepository.update(user1);
    }

    @Override
    public void del(int idUser) {
        userRepository.del(idUser);
    }

    @Override
    public Map<Integer, Long> countfollower() {
        System.out.println("3");
        List<User> users = listUser();
        System.out.println("4");
        Map<Integer,Long> map = new HashMap<>();
        System.out.println("5");
        for(int i=0;i<users.size();i++){
            long c = followedDAO.countfollow(users.get(i).getId());
            map.put(users.get(i).getId(),c);
        }
        System.out.println("6");
        return map;
    }

    @Override
    public List<User> sortUserbyfollow() {
        System.out.println("1");
        Map<Integer,Long> map = countfollower();
        System.out.println("2");
        Map<Integer,Long> sortByfollow = sortByQuestion(map,false);
        List<User> listSortUserfollowers = new ArrayList<>();
        User user = new User();
        Set set = sortByfollow.entrySet();
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry mentry = (Map.Entry) iterator.next();
            user = userRepository.findById((Integer) mentry.getKey());
            listSortUserfollowers.add(user);
        }
        System.out.println("gggg");
        return listSortUserfollowers;
    }

    private static Map<Integer, Long> sortByQuestion(Map<Integer, Long> unsortMap, final boolean order) {

        List<Map.Entry<Integer, Long>> list = new LinkedList<Map.Entry<Integer, Long>>(unsortMap.entrySet());

        // Sorting the list based on values
        Collections.sort(list, new Comparator<Map.Entry<Integer, Long>>() {
            public int compare(Map.Entry<Integer, Long> o1,
                               Map.Entry<Integer, Long> o2) {
                if (order) {
                    return o1.getValue().compareTo(o2.getValue());
                } else {
                    return o2.getValue().compareTo(o1.getValue());

                }
            }
        });

        // Maintaining insertion order with the help of LinkedList
        Map<Integer, Long> sortedMap = new LinkedHashMap<Integer, Long>();
        for (Map.Entry<Integer, Long> entry : list) {
            sortedMap.put(entry.getKey(), entry.getValue());
        }

        return sortedMap;
    }

}
