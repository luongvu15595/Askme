package com.luong.service;

import com.luong.dao.TagDAO;
import com.luong.dao.Tag_QuestionDAO;
import com.luong.model.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class TagServiceImpl implements TagService {
    @Autowired
    TagDAO tagDAO;
    @Autowired
    Tag_QuestionDAO tag_questionDAO;

    @Override
    public Tag find(String name) {
        return tagDAO.found(name);
    }

    @Override
    public List<Tag> listTag() {
        Map<Integer,Integer> map = new HashMap<>();
        int count =0;
        List<Tag> list = tagDAO.listTag();
        for (int i = 0; i<list.size();i++){
            Tag tag = list.get(i);
            count = tag_questionDAO.findlistTQ(tag.getId()).size();
            map.put(tag.getId(),count);
        }
        Map<Integer,Integer> sortByQuestioninTag = sortByQuestion(map,false);
        List<Tag> listtag = new ArrayList<>();
        Tag tag = new Tag();
        Set set = sortByQuestioninTag.entrySet();
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry mentry = (Map.Entry) iterator.next();
            tag = tagDAO.findTag((Integer) mentry.getKey());
            listtag.add(tag);
        }

        return listtag;
    }

    @Override
    public Map<Integer, Integer> countQuestionByTag() {
        Map<Integer,Integer> map = new HashMap<>();
        int count =0;
        List<Tag> list = tagDAO.listTag();
        for (int i = 0; i<list.size();i++){
            Tag tag = list.get(i);
            count = tag_questionDAO.findlistTQ(tag.getId()).size();
            map.put(tag.getId(),count);
        }
        return map;
    }

    private static Map<Integer, Integer> sortByQuestion(Map<Integer, Integer> unsortMap, final boolean order) {

        List<Map.Entry<Integer, Integer>> list = new LinkedList<Map.Entry<Integer, Integer>>(unsortMap.entrySet());

        // Sorting the list based on values
        Collections.sort(list, new Comparator<Map.Entry<Integer, Integer>>() {
            public int compare(Map.Entry<Integer, Integer> o1,
                               Map.Entry<Integer, Integer> o2) {
                if (order) {
                    return o1.getValue().compareTo(o2.getValue());
                } else {
                    return o2.getValue().compareTo(o1.getValue());

                }
            }
        });

        // Maintaining insertion order with the help of LinkedList
        Map<Integer, Integer> sortedMap = new LinkedHashMap<Integer, Integer>();
        for (Map.Entry<Integer, Integer> entry : list) {
            sortedMap.put(entry.getKey(), entry.getValue());
        }

        return sortedMap;
    }


    @Override
    public Tag findById(int id) {
        return tagDAO.findTag(id);
    }

    @Override
    public List<String> cut(String tag) {
        tag = tag.replace("[","");
        tag = tag.replace("]","");
        tag = tag.replace("{","");
        tag = tag.replace("}","");
        tag = tag.replace(":","");
        tag = tag.replace(",","");
        tag = tag.trim();
        tag = tag.replaceAll("\\s+", "");

        String[] test = tag.split("\"");
        List<String> listtag = new ArrayList<String>();
        for(int i=0;i<test.length;i++) {
            if (test[i].equals("name")) {
                listtag.add(test[i + 2]);
            }
        }
        return listtag;
    }

    @Override
    public Tag add(Tag tag) {
        tagDAO.create(tag);
        return tag;
    }

    @Override
    public void del(int id) {
        tagDAO.del(id);
    }
}
