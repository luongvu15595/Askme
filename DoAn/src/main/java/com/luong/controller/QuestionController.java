package com.luong.controller;

import com.luong.model.DTO.QuestionDTO;
import com.luong.model.Question;
import com.luong.model.Topic_Qestion;
import com.luong.model.User;
import com.luong.model.Vote_Question;
import com.luong.service.QuestionService;
import com.luong.service.Topic_QuestionService;
import com.luong.service.UserService;
import com.luong.service.Vote_QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Controller
public class QuestionController {

    @Autowired
    QuestionService questionService;
    @Autowired
    UserService userService;
    @Autowired
    Topic_QuestionService topic_questionService;

    @Autowired
    Vote_QuestionService vote_questionService;


    @RequestMapping(value = "/getAllQuestion", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<QuestionDTO> getListQuestion() {
        return questionService.listQuestion();

    }

    @RequestMapping(value = "/")
    public String getListOfQuestion() {
        return "listOfQuestion";

    }

    @RequestMapping(value = "/createQuestion", method = RequestMethod.GET, headers = "Accept=Application/json")
    public String createQuestion() {
        return "createQuestion";

    }

    @RequestMapping(value = "/createQuestion/{name}", method = RequestMethod.POST, headers = "Accept=Application/json")
    public
    @ResponseBody
    Question createQuestion1(@RequestBody Question question, @PathVariable("name") String name, Principal principal) {
        String email = principal.getName();
        User user = userService.findByEmail(email);
        questionService.add(question, user);
        Topic_Qestion topic_qestion = new Topic_Qestion();
        topic_questionService.add(topic_qestion, name, question);
        return question;
    }


    @RequestMapping(value = "/question/{id}", method= RequestMethod.GET)
    public String answer(@PathVariable(value="id") int  id , Model model) {
        model.addAttribute("question",questionService.findById(id));
        Vote_Question vote_question = vote_questionService.find(4,id);
        if (vote_question == null) {
            System.out.println("nullllll");
            model.addAttribute("vote_question","0");
        }
        else {
            if (vote_question.getDownvote() == 1)
                model.addAttribute("vote_question", "-1");
            else if (vote_question.getUpvote() == 1)
                model.addAttribute("vote_question", "+1");
        }
        return "question";

    }


}
