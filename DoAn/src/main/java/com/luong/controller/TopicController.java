package com.luong.controller;

import com.luong.model.Topic;
import com.luong.service.TopicService;
import com.luong.service.Topic_QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by Luong-PC on 4/13/2017.
 */
@Controller
public class TopicController {
    @Autowired
    TopicService topicService;
    @Autowired
    Topic_QuestionService topic_questionService;
    //lay ra 1 list topic
    @RequestMapping(value = "/listtopic",method = RequestMethod.GET,headers = "Accept=Application/json")
    @ResponseBody
    public List<Topic> gettopic(){
        return topicService.listTopic();
    }
    // tra ve trang 1 list topic
    @RequestMapping(value = "/listoftopic")
    public String getListOfQuestion() {
        return "listoftopic";

    }
    // tra ve so cau hoi trong tags
    @RequestMapping(value = "/countquestionbytopic",method = RequestMethod.GET,headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer,Integer> map (){
        return topicService.countQuestionByTopic();
    }
    //chuyen sang trang chua cac cau hoi voi topic tuong ung
    @RequestMapping(value = "/topic/{id}")
    public String getnametopic(@PathVariable("id") int id, Model model){
        model.addAttribute("topic",topicService.findById(id));
        return "listquestionbytopic";
    }
}
