package com.luong.controller;

import com.luong.model.User;
import com.luong.service.UserService;
import com.luong.service.Vote_AnswerService;
import com.luong.service.Vote_QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;

/**
 * Created by HP on 4/10/2017.
 */
@Controller
public class VoteController {
    @Autowired
    Vote_QuestionService vote_questionService;
    @Autowired
    Vote_AnswerService vote_answerService;
    @Autowired
    UserService userService;

    @RequestMapping(value = "/voteDownQuestion/{id}", method= RequestMethod.POST)
    @ResponseBody
    public void voteDownQuestion(@PathVariable(value="id") int  idQuestion, Principal principal) {
        String name = principal.getName();
        User user = userService.findByEmail(name);
        vote_questionService.down_Vote_Question(user.getId(),idQuestion);
    }

    @RequestMapping(value = "/voteUpQuestion/{id}", method= RequestMethod.POST)
    @ResponseBody
    public void voteUpQuestion(@PathVariable(value="id") int  idQuestion,Principal principal) {
        String name = principal.getName();
        User user = userService.findByEmail(name);
        vote_questionService.up_Vote_Question(user.getId(),idQuestion);
    }

    @RequestMapping(value = "/voteDownAnswer/{id}", method= RequestMethod.POST)
    @ResponseBody
    public void voteDownAnswer(@PathVariable(value="id") int  idAnswer,Principal principal) {
        String name = principal.getName();
        User user = userService.findByEmail(name);
       vote_answerService.down_Vote_Answer(user.getId(),idAnswer);
    }

    @RequestMapping(value = "/voteUpAnswer/{id}", method= RequestMethod.POST)
    @ResponseBody
    public void voteUpAnswer(@PathVariable(value="id") int  idAnswer,Principal principal) {
        String name = principal.getName();
        User user = userService.findByEmail(name);
        vote_answerService.up_Vote_Answer(user.getId(),idAnswer);

    }

}
