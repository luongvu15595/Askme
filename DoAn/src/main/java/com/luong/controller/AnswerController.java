package com.luong.controller;

import com.luong.model.Answer;
import com.luong.model.DTO.QuestionDTO;
import com.luong.model.User;
import com.luong.service.AnswerService;
import com.luong.service.QuestionService;
import com.luong.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
import java.util.Map;

@Controller
public class AnswerController {

    @Autowired
    QuestionService questionService;
    @Autowired
    AnswerService answerService;
    @Autowired
    UserService userService;

    @RequestMapping(value = "/getcount", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer, Long> getcount() {
        return answerService.count();

    }

    @RequestMapping(value = "/getAllAnswer", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<Answer> getAllAnswer() {
        return answerService.la();

    }

    @RequestMapping(value = "/getAllAnswer/{id}", method = RequestMethod.GET)
    @ResponseBody
    public List<Answer> answerForQuestion(@PathVariable(value = "id") int id) {

        return answerService.listAnswerOfQuestion(id);

    }

    @RequestMapping(value = "/createAnswer/{id}", method = RequestMethod.POST, headers = "Accept=Application/json")
    public @ResponseBody
    Answer saveAnswer(@RequestBody Answer answer, @PathVariable(value = "id") int idquestion, Principal principal) {
        String email = principal.getName();
        User user = userService.findByEmail(email);
        answerService.add(answer, idquestion,user);
        return answer;
    }
}


