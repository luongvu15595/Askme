package com.luong.controller;

import com.luong.model.Question;
import com.luong.model.User;
import com.luong.service.SecurityService;
import com.luong.service.UserService;
import com.luong.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.jws.soap.SOAPBinding;
import java.nio.file.attribute.UserPrincipal;
import java.security.Principal;
import java.util.List;
import java.util.Set;

/**
 * Created by Luong-PC on 4/8/2017.
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    // tra ve trang dang ki
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }
    // kiem tra dang ki
    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        // securityService.autologin(userForm.getEmail(), userForm.getPasswordConfirm());

        return "login";
    }
   // dang nhap
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }
    // tra ve 1 list user
    @RequestMapping(value =  "/listUser", method = RequestMethod.GET)
    @ResponseBody
    public List<User> listUser() {
        return userService.listUser();
    }


    // tra ve 1 trang chua list user
    @RequestMapping(value = "/listofuser")
    public String getListOfQuestion() {

        return "listUser";
    }

    //hien thi profile cua user tuong ung
    @RequestMapping(value = "/{id}")
    public String getUserDetail(@PathVariable("id") int id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user",user);
        int question = user.getQuestions().size();
        model.addAttribute("question",question);
        int answer = user.getAnswers().size();
        model.addAttribute("answer",answer);
        return "profile";

    }
   //chuyen sang trang list cau hoi cua user
    @RequestMapping(value = "/{id}/question")
    public String test2(@PathVariable("id") int id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user",user);
        return "questionbyuser";
    }

    //chuyen sang trang list answer  cua user
    @RequestMapping(value = "/{id}/answer")
    public String test3(@PathVariable("id") int id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user",user);
        return "AnswerByUser";
    }
    //kiem tra dang nhap chua
    @RequestMapping(value = "/testthu")
    @ResponseBody
    public Integer checklogin(Principal principal,Model model){
        if(principal != null){
            String name = principal.getName();
            User user = userService.findByEmail(name);
            model.addAttribute("user", user);
            return 1;
        }
        else return 2;
    }
    @RequestMapping(value = "/testabc")
    @ResponseBody
    public User checkedlogin(Principal principal, Model model){
        if(principal != null) {
            String name = principal.getName();
            User user1 = userService.findByEmail(name);

            return user1;
        }
        else return null;
    }

    //kiem tra tai khoan hien tai
    @RequestMapping(value = "/currentuser/{id}")
    @ResponseBody
    public Integer checkcurrent(Principal principal,Model model,@PathVariable("id") int id){
        if(principal != null){
            String name = principal.getName();
            User user = userService.findByEmail(name);
            if(user.getId() == id )
            {
                return 3;
            }
            else {return 1;}
        }
        else return 2;
    }
}
