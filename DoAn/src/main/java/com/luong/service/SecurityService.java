package com.luong.service;

/**
 * Created by Luong-PC on 4/8/2017.
 */
public interface SecurityService {


    String findLoggedInEmail();

    void autologin(String email, String password);

}
