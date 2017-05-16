package com.luong.controller;

import com.luong.model.Report;
import com.luong.model.User;
import com.luong.service.ReportService;
import com.luong.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public void addreport(@RequestBody Report report, @PathVariable(value ="id") int idQuestion ,Principal principal) {
        User user = userService.findByEmail(principal.getName());
        if (user ==null ) return;
        // System.out.println(content);
        // System.out.println(idQuestion);
        reportService.add(user,idQuestion,report.getContent());

    }

    @RequestMapping(value = "/listreports")
    public String reports() {
        return "listreports";
    }

    @RequestMapping(value = "/reports", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<Report> listreports(Principal principal) {
        User user = new User();
        if (principal != null) {
            String email = principal.getName();
            user = userService.findByEmail(email);
            if (userService.isAdmin(user) ==1) return reportService.listReports();
        }
        return null;
    }
    //3/5 tra ve so luong report
    @RequestMapping(value = "/ireport", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Integer ireport(Principal principal){
        if(principal != null){
            String name = principal.getName();
            User user = userService.findByEmail(name);
            if (userService.isAdmin(user) ==1) return reportService.listReports().size();
        }
        return 0;
    }
    @RequestMapping(value = "/mapstatus", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer,Integer> ireport(){
            List<Report> list = reportService.listReports();
        Map<Integer,Integer> map = new HashMap<>();
            for(Report report : list){
                map.put(report.getId(),report.getStatus());
            }

        return map;
    }

    @RequestMapping(value = "/updatestatus/{id}", method = RequestMethod.POST, headers = "Accept=Application/json")
    @ResponseBody
    public void updatestatus(@PathVariable("id") int id){
        Report report = reportService.find(id);
        reportService.update(report);
    }
}
