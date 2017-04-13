package com.luong.controller;

import com.luong.model.*;
import com.luong.model.DTO.QuestionDTO;
import com.luong.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;
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
    @Autowired
    AnswerService answerService;

    // lay ra 1 list cau hoi
    @RequestMapping(value = "/getAllQuestion", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<QuestionDTO> getListQuestion() {
        return questionService.listQuestion();

    }
    //tra ve trang chu
    @RequestMapping(value = "/")
    public String getListOfQuestion() {
        return "listOfQuestion";

    }
    //chuyen den trang tao cau hoi
    @RequestMapping(value = "/createQuestion", method = RequestMethod.GET, headers = "Accept=Application/json")
    public String createQuestion() {
        return "createQuestion";

    }
    //tao cau hoi
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

    //hien thi chi tiet cau hoi va vote cho cau hoi
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


   //chuc nang search
    @RequestMapping(value = "/search/{string}",method = RequestMethod.GET, headers = "Accept=Application/json")
    public String search(@PathVariable("string") String string,Model model){
        model.addAttribute("string",string);
        return "search";
    }

    @RequestMapping(value = "/listsearchQuestion/{string}",method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<QuestionDTO> listsearchQuestion(@PathVariable("string") String string){
        return questionService.search(string);
    }
   //lay ra tat ca question theo topic tuong ung
    @RequestMapping(value = "/getAllQuestionByidTopic/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<Question> getnametopic(@PathVariable("id") int id){
        return topic_questionService.findQuestionByTopic(id);
    }
    // lay ra tat ca question theo user
    @RequestMapping(value = "/getAllQuestionByUser/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<Question> getQuestionByUser(@PathVariable("id") int id){
        User user = userService.findById(id);
        List<Question> q = new ArrayList<Question>(user.getQuestions()) ;
       return q;
    }

    // lay ra tat ca topic theo question
    @RequestMapping(value = "/getAllTopicByQuestion/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<Topic> getAllTopicByQuestion(@PathVariable("id") int id){
        return topic_questionService.findTopicByQuestion(id);
    }

}
