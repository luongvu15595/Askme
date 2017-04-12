package com.luong.dao;

import com.luong.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleDAO extends JpaRepository<Role, Integer> {
    Role findByName(String name);
}
