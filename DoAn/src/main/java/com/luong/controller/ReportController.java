package com.luong.controller;

import com.luong.model.User;
import com.luong.service.ReportService;
import com.luong.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;

/**
 * Created by HP on 4/24/2017.
 */
@Controller
public class ReportController {
    @Autowired
    UserService userService;
    @Autowired
    ReportService reportService;

    @RequestMapping(value = "/report/{id}")
    public String reportpage(@PathVariable(value ="id") int idQuestion , Model model) {
        model.addAttribute("idquestion",idQuestion);
        return "report";

    }
    @RequestMapping(value = "/addreport/{id}")
    @ResponseBody
    public void addreport(@RequestBody String content, @PathVariable(value ="id") int idQuestion ,Principal principal) {
        User user = userService.findByEmail(principal.getName());
        if (user ==null ) return;
        System.out.println(content);
        System.out.println(idQuestion);
        reportService.add(user,idQuestion,content);

    }
}
