package com.luong.controller;

import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.model.User;
import com.luong.service.SecurityService;
import com.luong.service.UserService;
import com.luong.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.attribute.UserPrincipal;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
        List<User> list = userService.sortUserbyfollow();
        System.out.println("abc");
        return list;
    }

    @RequestMapping(value =  "/countfollower", method = RequestMethod.GET)
    @ResponseBody
    public Map<Integer,Long> countFollower() {
        return userService.countfollower();
    }


    // tra ve 1 trang chua list user
    @RequestMapping(value = "/listofuser")
    public String getListOfQuestion(Principal principal,Model model) {
        User userlogin = new User();
        userlogin.setEmail("x");
        userlogin.setName("x");
        if (principal != null) {
            String email = principal.getName();
            userlogin = userService.findByEmail(email);
        }
        model.addAttribute("userlogin", userlogin);
        return "listUser";
    }

    //hien thi profile cua user tuong ung
    @RequestMapping(value = "/{id}")
    public String getUserDetail(@PathVariable("id") int id, Model model, Principal principal) {
        User userlogin = new User();
        userlogin.setEmail("x");
        userlogin.setName("x");
        if (principal != null) {
            String email = principal.getName();
            userlogin = userService.findByEmail(email);
        }
        model.addAttribute("userlogin", userlogin);
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
            if (userService.isAdmin(user) ==1) return 3;
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

    @RequestMapping(value = "/changepass")
    public String dir(){
        return "changePassword";
    }

    @RequestMapping(value = "/changepassword/{pass}",method = RequestMethod.GET)
    @ResponseBody
    public Integer post(@PathVariable("pass") String change,Principal principal){
        String name = change;
        System.out.println(change);
        String email = principal.getName();
        User user = userService.findByEmail(email);
        PasswordEncoder token = new BCryptPasswordEncoder();
       Boolean check = token.matches(change,user.getPassword());
       if(check){
           return 1;
       }
       else {return 0;}

    }
    @RequestMapping(value = "/changepassword/{pass}",method = RequestMethod.POST)
    @ResponseBody
    public void submit(@PathVariable("pass") String change,Principal principal){
        String name = change;
        System.out.println(change);
        String email = principal.getName();
        User user = userService.findByEmail(email);
        PasswordEncoder token = new BCryptPasswordEncoder();
        String password = token.encode(change);
        user.setPassword(password);
        userService.updatePassword(user);
    }

    @RequestMapping(value = "/imageuser/{id}", method = RequestMethod.GET)
    public  void  loadimage(@PathVariable("id") int id,HttpServletResponse response) throws IOException {
        response.setContentType("image/png");
        User user = userService.findById(id);
        System.out.println(user.getId()+"ID");
        System.out.println(user.getImage()+ "IMAGE");
        String url = user.getImage();
        url = "C:\\testUpload\\" +url;
        System.out.println(url);
        BufferedImage image = ImageIO.read(new File(url));
        ImageIO.write(image, "png", response.getOutputStream());

    }

    //9/5 xoa user trong database
    @RequestMapping(value = "/deluser/{id}", method= RequestMethod.DELETE)
    @ResponseBody
    public void deluser(@PathVariable(value="id") int  idUser) {
        userService.del(idUser);
    }

    @RequestMapping(value = "/manageruser")
    public String managerUser() {
        return "managerUser";
    }

    @RequestMapping(value = "/edituser",method = RequestMethod.PUT,headers = "Accept=Application/json")
    @ResponseBody
    public void updateNameUser(@RequestBody User user) {
        userService.updateName(user);

    }

    @RequestMapping(value = "/countlistuser")
    @ResponseBody
    public Integer countListUser() {
        return userService.countListUser();
    }
}
