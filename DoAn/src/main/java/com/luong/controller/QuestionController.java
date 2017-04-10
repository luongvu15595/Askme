package com.luong.controller;

import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.List;


/**
 * Created by HP on 3/30/2017.
 */
@Controller
public class QuestionController {

    @Autowired
    QuestionService questionService;

    @RequestMapping(value = "/getAllQuestion", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<QuestionDTO> getListQuestion() {
        return questionService.listQuestion();

    }

    @RequestMapping(value = "/listOfQuestion")
    public String getListOfQuestion() {
        return "listOfQuestion";

    }

    @RequestMapping(value = "/createQuestion", method = RequestMethod.GET, headers = "Accept=Application/json")
    public String createQuestion() {
        return "createQuestion";

    }

    @RequestMapping(value = "/createQuestion", method = RequestMethod.POST, headers = "Accept=Application/json")
    public
    @ResponseBody
    Question createQuestion1(@RequestBody Question question) {
        System.out.println(question.getContent());
        questionService.add(question);
        return question;
    }
    @RequestMapping(value = "/question/{id}", method= RequestMethod.GET)
    public String answer(@PathVariable(value="id") int  id , Model model) {
        model.addAttribute("question",questionService.findById(id));
        return "question";

    }



}
