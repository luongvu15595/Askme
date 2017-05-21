package com.luong.service;

import com.luong.model.Tag;

import java.util.List;
import java.util.Map;

public interface TagService {
    public Tag find(String name);
    public List<Tag> listTag();
    public Map<Integer,Integer> countQuestionByTag();
    public Tag findById(int id);
    public List<String> cut(String tag);
    public Tag add(Tag tag);
    public void del(int id);

}
