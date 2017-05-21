package com.luong.controller;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.luong.model.*;
import com.luong.model.DTO.QuestionDTO;
import com.luong.service.*;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class QuestionController {

    @Autowired
    QuestionService questionService;
    @Autowired
    UserService userService;
    @Autowired
    Tag_QuestionService tag_questionService;

    @Autowired
    Vote_QuestionService vote_questionService;
    @Autowired
    AnswerService answerService;
    @Autowired
    TagService tagService;

    // lay ra 1 list cau hoi
    @RequestMapping(value = "/getAllQuestion", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<QuestionDTO> getListQuestion() {
        Map<Integer, List> map = tag_questionService.tagsOfQuestion();

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

    @RequestMapping(value = "/image/{id}", method = RequestMethod.GET)
    public  void   loadimage(@PathVariable("id") int id,HttpServletResponse response) throws IOException {
         response.setContentType("image/png");
          QuestionDTO question = questionService.findById(id);
          String url = question.getImage();
          url = "C:\\testUpload\\" +url;
          BufferedImage image = ImageIO.read(new File(url));
          ImageIO.write(image, "png", response.getOutputStream());

    }

    @RequestMapping(value = "/createQuestion", method = RequestMethod.POST)
    public
    @ResponseBody
    Object createQuestion1(@RequestParam(value = "question") String question, @RequestParam(value = "file") MultipartFile file, HttpServletRequest request, @RequestParam(value = "tag") String tag, Principal principal) {
        String email = principal.getName();
        List<String> listtag = tagService.cut(tag);
        User user = userService.findByEmail(email);
        System.out.println("Inside File upload " + question);
        ObjectMapper mapper = new ObjectMapper();
        Question question1 = new Question();

        try {
            question1 = mapper.readValue(question, Question.class);

        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(!file.isEmpty()) {
            String path = "C:\\testUpload\\";
            System.out.println("Root Directory" + path);
            try {
                InputStream inputStream = file.getInputStream();
                FileUtils.forceMkdir(new File(path));
                file.transferTo(new File(path + file.getOriginalFilename()));
                String imageUpload = file.getOriginalFilename();
                System.out.println(imageUpload);
                question1.setImage(imageUpload);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        question1 = questionService.add(question1, user);
        tag_questionService.add(listtag, question1);
        return null;

    }

    @RequestMapping(value = "/createQuestion1", method = RequestMethod.POST)
    public
    @ResponseBody
    Object createQuestion2(@RequestParam(value = "question") String question, @RequestParam(value = "tag") String tag, Principal principal) {
        String email = principal.getName();
        System.out.println(tag);
        List<String> listtag = tagService.cut(tag);
        User user = userService.findByEmail(email);
        System.out.println("Inside File upload " + question);
        ObjectMapper mapper = new ObjectMapper();
        Question question1 = new Question();

        try {
            question1 = mapper.readValue(question, Question.class);

        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        question1 = questionService.add(question1, user);
        tag_questionService.add(listtag, question1);
        return question1;

    }

    //hien thi chi tiet cau hoi va vote cho cau hoi
    @RequestMapping(value = "/question/{id}", method = RequestMethod.GET)
    public String answer(@PathVariable(value = "id") int idQuestion, Model model, Principal principal) {
        User user = new User();
        user.setEmail("x");
        user.setName("x");
        model.addAttribute("isAdmin", 0);
        if (principal != null) {
            String email = principal.getName();
            user = userService.findByEmail(email);
            model.addAttribute("isAdmin", userService.isAdmin(user));
        }
        model.addAttribute("userlogin", user);
        model.addAttribute("question", questionService.findById(idQuestion));
        model.addAttribute("up_vote_question", vote_questionService.countUp(idQuestion));
        model.addAttribute("down_vote_question", vote_questionService.countDown(idQuestion));
        Vote_Question vote_question = new Vote_Question();
        vote_question.setDownvote(0);
        vote_question.setUpvote(0);
        if (vote_questionService.find(user, idQuestion) != null) {
            vote_question = vote_questionService.find(user, idQuestion);
            if (vote_question.getDownvote() == 1) model.addAttribute("voted", 2);//da down
            if (vote_question.getUpvote() == 1) model.addAttribute("voted", 1);//da up
        } else model.addAttribute("voted", 0);//chua vote or chua dang nhap

        return "question";

    }


    //chuc nang search
    @RequestMapping(value = "/search/{string}", method = RequestMethod.GET, headers = "Accept=Application/json")
    public String search(@PathVariable("string") String string, Model model) {
        model.addAttribute("string", string);
        return "search";
    }

    @RequestMapping(value = "/checksearchQuestion/{string}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Integer checksearchQuestion(@PathVariable("string") String string) {
        if (!questionService.search(string).isEmpty()) {
            return 1;
        } else {
            return 2;
        }
    }

    @RequestMapping(value = "/listsearchQuestion/{string}", method = RequestMethod.GET, headers = "Accept=Application/json")

    @ResponseBody

    public List<Question> listsearchQuestion(@PathVariable("string") String string) {
        if (!questionService.search(string).isEmpty()) {
            return questionService.search(string);
        } else return null;
    }

    @RequestMapping(value = "/countanswerquestionsearch/{string}", method = RequestMethod.GET, headers = "Accept=Application/json")

    @ResponseBody

    public Map<Integer,Long> countAnswerQuestionSearch(@PathVariable("string") String string) {
        return questionService.countanswerquestionsearch(string);
    }

    @RequestMapping(value = "/tagquestionsearch/{string}", method = RequestMethod.GET, headers = "Accept=Application/json")

    @ResponseBody

    public Map<Integer,List> tagQuestionSearch(@PathVariable("string") String string) {
        return questionService.tagquestionsearch(string);
    }

    @RequestMapping(value = "/countupvotequestionsearch/{string}", method = RequestMethod.GET, headers = "Accept=Application/json")

    @ResponseBody

    public Map<Integer,Long> countUpvoteQuestionSearch(@PathVariable("string") String string) {
        return questionService.countUpvotequestionsearch(string);
    }
    //lay ra tat ca question theo tag tuong ung
    @RequestMapping(value = "/getAllQuestionByidTag/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<Question> getnametag(@PathVariable("id") int id) {

        return tag_questionService.findQuestionByTag(id);
    }

    @RequestMapping(value = "/gettagbytag/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer,List> getnameag1(@PathVariable("id") int id) {

        return questionService.listtagbytag(id);
    }

    @RequestMapping(value = "/getcountanswerAllQuestionByidTag/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer,Long> mapcountanswerbyquestionfortag(@PathVariable("id") int id) {
        return questionService.countanswerquestionbytag(id);
    }

    @RequestMapping(value = "/mapcountupvotebyquestionfortag/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer,Long> mapCountupVoteByQuestionForTag(@PathVariable("id") int id) {
        return questionService.countUpVotequestionbytag(id);
    }

    // lay ra tat ca question theo user
    @RequestMapping(value = "/getAllQuestionByUser/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<Question> getQuestionByUser(@PathVariable("id") int id) {
        User user = userService.findById(id);
        List<Question> q = new ArrayList<Question>(user.getQuestions());
        return q;
    }

    @RequestMapping(value = "/countanswerquestionbyuser/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer,Long> countAnswerQuestionByUser(@PathVariable("id") int id) {
        return questionService.countanswerquestionbyuser(id);
    }

    @RequestMapping(value = "/getlisttagquestionbyuser/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer,List> getlisttagquestionbyuser(@PathVariable("id") int id) {
        return questionService.tagQuestionbyuser(id);
    }
    @RequestMapping(value = "/countupvotetagquestionbyuser/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer,Long> countupvotetagquestionbyuser(@PathVariable("id") int id) {
        return questionService.countUpVoteQuestionUser(id);
    }
    // lay ra tat ca tag theo question
    @RequestMapping(value = "/getAllTagByQuestion/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public List<Tag> getAllTagByQuestion(@PathVariable("id") int id) {
        return tag_questionService.findTagByQuestion(id);
    }

    // lay ra tat ca tag theo question
    @RequestMapping(value = "/getAllTagByQuestion", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer, List> getAllTagByQuestion() {
        return tag_questionService.tagsOfQuestion();
    }

    //ngay 17/4
    // update question
    //26-4 : edit Question
    @RequestMapping(value = "/updatequestion", method = RequestMethod.PUT,headers = "Accept=Application/json")
    @ResponseBody
    public void updatequestion(@RequestBody Question question) {
        questionService.update(question);

    }

    @RequestMapping(value = "/getmapvoteanswers/{id}", method = RequestMethod.GET, headers = "Accept=Application/json")
    @ResponseBody
    public Map<Integer, Map<String, Long>> getmapvoteanswers(@PathVariable("id") int idQuestion, Principal principal) {
        User user = new User();
        if (principal != null) {
            String email = principal.getName();
            user = userService.findByEmail(email);
        }
        return answerService.voteAnswerData(user, idQuestion);
    }

    //28-4 delQues
    @RequestMapping(value = "/delquestion/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public void delquestion(@PathVariable(value = "id") int idQuestion) {
        questionService.del(idQuestion);
        System.out.println(idQuestion);
    }
    //6/5
    @RequestMapping(value = "/countvoteup",method = RequestMethod.GET)
    @ResponseBody
    public  Map<Integer,Long> countVoteUp(){
        return questionService.countUpVote();
    }


    @RequestMapping(value = "/countvoteuphotweek",method = RequestMethod.GET)
    @ResponseBody
    public  Map<Integer,Long> countVoteUpHotWeek(){
        return questionService.countUpVoteHotWeek();
    }

    @RequestMapping(value = "/countvoteuphotmonth",method = RequestMethod.GET)
    @ResponseBody
    public  Map<Integer,Long> countVoteUpHotMonth(){
        return questionService.countUpVoteHotMonth();
    }

    @RequestMapping(value = "/listquestionhotweek",method = RequestMethod.GET)
    @ResponseBody
    public  List<Question> hotWeek(){
        return questionService.sortHotWeek();
    }

    @RequestMapping(value = "/countanswerofquestionhotweek",method = RequestMethod.GET)
    @ResponseBody
    public  Map<Integer, Long> count(){
        return questionService.countAnswerHotWeek();
    }

    @RequestMapping(value = "/tagQuestionHotWeek",method = RequestMethod.GET)
    @ResponseBody
    public  Map<Integer, List> tagQuestionHotWeek(){
        return questionService.tagQuestionHotWeek();
    }

    @RequestMapping(value = "/listquestionhotmonth",method = RequestMethod.GET)
    @ResponseBody
    public  List<Question> hotMonth(){
        return questionService.sortHotMonth();
    }

    @RequestMapping(value = "/countanswerofquestionhotmonth",method = RequestMethod.GET)
    @ResponseBody
    public  Map<Integer, Long> countMonth(){
        return questionService.countAnswerHotMonth();
    }

    @RequestMapping(value = "/tagQuestionHotmonth",method = RequestMethod.GET)
    @ResponseBody
    public  Map<Integer, List> tagQuestionHotMonth(){
        return questionService.tagQuestionHotMonth();
    }

    @RequestMapping(value = "/countlistquestion",method = RequestMethod.GET)
    @ResponseBody
    public  Integer countlistquestion(){
        return questionService.countquestion();
    }

    @RequestMapping(value = "/listsortuserbyquestion",method = RequestMethod.GET)
    @ResponseBody
    public  List<User> listsortuserbyquestion(){
        return questionService.listSortUserQuetions();
    }

    @RequestMapping(value = "/listsortquestionbyuser",method = RequestMethod.GET)
    @ResponseBody
    public  Map<Integer,Long> listsortquestionbyuser(){
        return questionService.countquestionUser();
    }

    @RequestMapping(value = "/listsortuserbyanswer",method = RequestMethod.GET)
    @ResponseBody
    public  List<User> listSortUserByAnswer(){
        return questionService.listSortUserAnswers();
    }

    @RequestMapping(value = "/listsortanswerbyuser",method = RequestMethod.GET)
    @ResponseBody
    public  Map<Integer,Long> listsortanswerbyuser(){
        return questionService.countAnswerUser();
    }

    @RequestMapping(value = "/listquestionfollowingbyuser/{id}",method = RequestMethod.GET)
    @ResponseBody
    public List<Question> listQuestionOfUserFollowing(@PathVariable(value = "id") int id) {
        return questionService.listquestionfollowing(id);
    }

    @RequestMapping(value = "/countanswerfollowingbyuser/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Map<Integer,Long> countAnswerOfUserFollowing(@PathVariable(value = "id") int id) {
        return questionService.countanswerquestionfollowingbyuser(id);
    }

    @RequestMapping(value = "/countvoteupfollowingbyuser/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Map<Integer,Long> countVoteUpOfUserFollowing(@PathVariable(value = "id") int id) {
        return questionService.countUpVoteQuestionfollowingUser(id);
    }
    @RequestMapping(value = "/listtagfollowingbyuser/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Map<Integer,List> listtagOfUserFollowing(@PathVariable(value = "id") int id) {
        return questionService.tagQuestionbyfollowinguser(id);
    }
}
