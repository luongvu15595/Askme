package com.luong.controller;

import com.luong.model.Answer;
import com.luong.model.DTO.QuestionDTO;
import com.luong.service.AnswerService;
import com.luong.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * Created by HP on 4/3/2017.
 */
@Controller
public class AnswerController {

    @Autowired
    QuestionService questionService;
    @Autowired
    AnswerService answerService;

    @RequestMapping(value = "/getcount", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<QuestionDTO,Long> getcount() {
        return answerService.count();

    }

    @RequestMapping(value = "/getAllAnswer", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<Answer> getAllAnswer() {
        return answerService.la();

    }

    @RequestMapping(value = "/getAllAnswer/{id}", method= RequestMethod.GET)
    @ResponseBody
    public List<Answer> answerForQuestion(@PathVariable(value="id") int  id) {

        return answerService.listAnswerOfQuestion(id);

    }
    @RequestMapping(value = "/createAnswer/{id}", method = RequestMethod.POST, headers = "Accept=Application/json")
    public @ResponseBody Answer saveAnswer(@RequestBody Answer answer, @PathVariable(value="id") int  idquestion) {
        System.out.println(answer.getContent());
        System.out.print(idquestion);
        answerService.add(answer,idquestion);
        return answer;
    }


}


