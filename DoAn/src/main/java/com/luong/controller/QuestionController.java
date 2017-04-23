package com.luong.controller;

import com.luong.model.*;
import com.luong.model.DTO.QuestionDTO;
import com.luong.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
        Map<Integer,List> map = topic_questionService.topicsOfQuestion();

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
    @RequestMapping(value = "/createQuestion/{name}", method = RequestMethod.POST, headers = "Accept=Application/json;charset=UTF-8")
    public
    @ResponseBody
    Question createQuestion1(@RequestBody Question question, @PathVariable("name") String name, Principal principal) {
       if(principal!=null) {
           String email = principal.getName();
           User user = userService.findByEmail(email);
           questionService.add(question, user);
           Topic_Qestion topic_qestion = new Topic_Qestion();
           topic_questionService.add(topic_qestion, name, question);
       }
        return question;
    }

    //hien thi chi tiet cau hoi va vote cho cau hoi
    @RequestMapping(value = "/question/{id}", method= RequestMethod.GET)
    public String answer(@PathVariable(value="id") int  idQuestion , Model model,Principal principal) {
        User user = new User();
        user.setName("Luong");
        if (principal != null) {
            String email = principal.getName();
            user = userService.findByEmail(email);
        }
        model.addAttribute("userquestion",user);
        model.addAttribute("question", questionService.findById(idQuestion));
        model.addAttribute("up_vote_question", vote_questionService.countUp(idQuestion));
        model.addAttribute("down_vote_question", vote_questionService.countDown(idQuestion));
        Vote_Question vote_question = new Vote_Question();
        vote_question.setDownvote(0);
        vote_question.setUpvote(0);
        if (vote_questionService.find(user, idQuestion) != null) {
            vote_question = vote_questionService.find(user, idQuestion);
        }
        model.addAttribute("voted", vote_question);

        return "question";

    }


   //chuc nang search
    @RequestMapping(value = "/search/{string}",method = RequestMethod.GET, headers = "Accept=Application/json")
    public String search(@PathVariable("string") String string,Model model){
        model.addAttribute("string",string);
        return "search";
    }

    @RequestMapping(value = "/checksearchQuestion/{string}",method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Integer checksearchQuestion(@PathVariable("string") String string){
        if(!questionService.search(string).isEmpty()){
            return 1;
        }
        else{ return 2;}
    }

    @RequestMapping(value = "/listsearchQuestion/{string}",method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<QuestionDTO> listsearchQuestion(@PathVariable("string") String string){
        if(!questionService.search(string).isEmpty()){
        return questionService.search(string);}
        else return null;
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
    // lay ra tat ca topic theo question
    @RequestMapping(value = "/getAllTopicByQuestion", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer,List> getAllTopicByQuestion(){
        return topic_questionService.topicsOfQuestion();
    }

    //ngay 17/4
    // delete question
    @RequestMapping(value = "/deletequestion/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")

    public ModelAndView deleteQuestion(@PathVariable("id")int id){
        questionService.remote(id);
        return new ModelAndView("redirect:/");
    }
    //ngay 17/4
    // update question

    @RequestMapping(value = "/updatequestion/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")

    public String editQuestion(@PathVariable("id")int id, Model model){
        QuestionDTO question = questionService.findById(id);
        model.addAttribute("questionFormUpdate",question);
        return "editQuestion";
    }

    @RequestMapping(value = "/updatequestion",method = RequestMethod.PUT, headers = "Accept=Application/json")
    public
    @ResponseBody
    Question updateQuestion1(@RequestBody Question question,Principal principal) {
        Date date = questionService.findById(question.getId_question()).getTime();
        String name = principal.getName();
        User user = userService.findByEmail(name);
        questionService.update(question,user,date);
        return question;
    }

}
