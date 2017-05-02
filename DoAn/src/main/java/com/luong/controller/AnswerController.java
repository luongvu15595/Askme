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
import java.util.ArrayList;
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
    //dem so cau tra loi
    @RequestMapping(value = "/getcount", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer, Long> getcount() {
        return answerService.count();

    }
    @RequestMapping(value = "/getListCountVoteUpAnswer/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer, Long> getListCountVoteUpAnswer(@PathVariable(value = "id") int id) {
        return answerService.countVoteUpAnswers(id);

    }

    @RequestMapping(value = "/getListCountVoteDownAnswer/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer, Long> getListCountVoteDownAnswer(@PathVariable(value = "id") int id) {
        return answerService.countVoteDownAnswers(id);

    }

    //lay tat ca cau ra loi
    @RequestMapping(value = "/getAllAnswer", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<Answer> getAllAnswer() {
        return answerService.la();

    }
   //lay ra tat ca cau tra loi theo question tuong ung
    @RequestMapping(value = "/getallanswer/{id}", method = RequestMethod.GET)
    @ResponseBody
    public List<Answer> answerForQuestion(@PathVariable(value = "id") int id) {

        return answerService.listAnswerOfQuestion(id);

    }
    //tao cau hoi
    @RequestMapping(value = "/createAnswer/{id}", method = RequestMethod.POST, headers = "Accept=Application/json")
    public @ResponseBody
    Answer saveAnswer(@RequestBody Answer answer, @PathVariable(value = "id") int idquestion, Principal principal) {
        if (principal != null) {
            String email = principal.getName();
            User user = userService.findByEmail(email);
            answer= answerService.add(answer, idquestion, user);
        }
        return answer;
    }
    //lay ra tat ca cau tra loi cua User tuong ung
    @RequestMapping(value = "/getAllAnswerByUser/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<Answer> getQuestionByUser(@PathVariable("id") int id){
        User user = userService.findById(id);
        List<Answer> q = new ArrayList<Answer>(user.getAnswers()) ;
        return q;
    }

    //25-4 : thuc hien gui yeu cau xoa cau tra loi
    @RequestMapping(value = "/delanswer/{id}", method= RequestMethod.DELETE)
    @ResponseBody
    public void voteDownQuestion(@PathVariable(value="id") int  idAnswer) {
        answerService.del(idAnswer);
        System.out.println(idAnswer);
    }

    //26-4 : edit Answer
    @RequestMapping(value = "/editanswer", method= RequestMethod.PUT)
    @ResponseBody
    public void editAnswer(@RequestBody Answer answer) {
        answerService.updateAnswer(answer);
        System.out.println(answer.getId()+ "   " + answer.getContent());
    }
}


