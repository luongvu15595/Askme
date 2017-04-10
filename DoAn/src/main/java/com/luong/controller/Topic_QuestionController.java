package com.luong.controller;

import com.luong.model.Question;
import com.luong.model.Topic_Qestion;
import com.luong.service.QuestionService;
import com.luong.service.Topic_QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * Created by Luong-PC on 4/4/2017.
 */
@Controller
public class Topic_QuestionController {

    @Autowired
    Topic_QuestionService topic_questionService;


    @RequestMapping(value = "/createTQ", method = RequestMethod.GET, headers = "Accept=Application/json")
    public String createQuestion() {
        return "createTopic_Question";
    }

    @RequestMapping(value = "/createTopicQuestion", method = RequestMethod.POST,headers = "Accept=Application/json;charset=UTF-8")
    public @ResponseBody Topic_Qestion create( @RequestParam("name") String name) {

        List<String> s = topic_questionService.name(name);
        System.out.println(name);
        Topic_Qestion topic_qestion = new Topic_Qestion();
        topic_questionService.add(topic_qestion,name);
        return topic_qestion;

    }
}
