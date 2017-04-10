package com.luong.model.DTO;

import com.luong.model.Role;
import com.luong.model.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * Created by Luong-PC on 3/31/2017.
 */
public class UserDTO {

    private int id;
    private String name;
    private String password;
    private String email;
    private String image;
    private List<Role> roles;

    public UserDTO() {
    }

    @Transactional
    public static UserDTO convertUser(User u) {
        UserDTO ud = new UserDTO();
        ud.id = u.getId();
        ud.name = u.getName();
        ud.password = u.getPassword();
        ud.email = u.getEmail();
        ud.image = u.getImage();
        ud.roles= u.getRoles();
        return ud;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
}
