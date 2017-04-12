package com.luong.service;

public interface SecurityService {


    String findLoggedInEmail();

    void autologin(String email, String password);

}
