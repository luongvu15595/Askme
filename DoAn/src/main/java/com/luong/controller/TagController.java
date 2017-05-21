package com.luong.controller;

import com.luong.model.Tag;
import com.luong.service.TagService;
import com.luong.service.Tag_QuestionService;
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
public class TagController {
    @Autowired
    TagService tagService;
    @Autowired
    Tag_QuestionService tag_questionService;
    //lay ra 1 list tag
    @RequestMapping(value = "/listtag",method = RequestMethod.GET,headers = "Accept=Application/json")
    @ResponseBody
    public List<Tag> gettag(){
        return tagService.listTag();
    }
    // tra ve trang 1 list tag
    @RequestMapping(value = "/listoftag")
    public String getListOfQuestion() {
        return "listoftag";
    }
    @RequestMapping(value = "/managertags")
    public String getListtag() {
        return "managertags";
    }
    @RequestMapping(value = "/listtaghot",method = RequestMethod.GET,headers = "Accept=Application/json")
    @ResponseBody
    public List<Tag> gettaghot(){
        return tagService.listTag().subList(0,7);
    }
    // tra ve so cau hoi trong tags
    @RequestMapping(value = "/countquestionbytag",method = RequestMethod.GET,headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer,Integer> map (){
        return tagService.countQuestionByTag();
    }
    //chuyen sang trang chua cac cau hoi voi tag tuong ung
    @RequestMapping(value = "/tag/{id}")
    public String getnametag(@PathVariable("id") int id, Model model){
        model.addAttribute("tag", tagService.findById(id));
        return "listquestionbytag";
    }

    @RequestMapping(value = "/deletetag/{id}",method = RequestMethod.DELETE)
    public void deltag(@PathVariable("id") int id){
        tagService.del(id);
    }
}
