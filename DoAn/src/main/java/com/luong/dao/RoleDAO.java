package com.luong.dao;

import com.luong.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Luong-PC on 4/8/2017.
 */
public interface RoleDAO extends JpaRepository<Role,Integer> {
    Role findByName(String name);
}
