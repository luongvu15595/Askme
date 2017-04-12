package com.luong.service;

        import com.luong.dao.QuestionDAO;
        import com.luong.dao.UserDAO;
        import com.luong.model.DTO.QuestionDTO;
        import com.luong.model.Question;
        import com.luong.model.User;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Service;

        import java.sql.Timestamp;
        import java.text.SimpleDateFormat;
        import java.util.ArrayList;
        import java.util.Date;
        import java.util.List;

/**
 * Created by HP on 3/30/2017.
 */
@Service
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    QuestionDAO dao;

    @Autowired
    UserDAO userDAO;

    @Override
    public QuestionDTO findById(int id) {

        return QuestionDTO.convert(dao.findById(id));
    }


    @Override
    public List<QuestionDTO> listQuestion() {
        QuestionDTO qt = new QuestionDTO();
        List<QuestionDTO> lq = new ArrayList<QuestionDTO>();
        List<Question> q = dao.listQuestion();
        for (int i = 0; i < q.size(); i++) {
            qt = QuestionDTO.convert(q.get(i));
            Date time;
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            lq.add(qt);
        }
        return lq;
    }

    @Override
    public void add(Question question, User user) {
        question.setTime(new Date());
        question.setUser(user);
        dao.add(question);
    }
}
