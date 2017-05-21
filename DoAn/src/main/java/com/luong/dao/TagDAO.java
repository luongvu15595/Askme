package com.luong.dao;

import com.luong.model.Tag;

import java.util.List;

public interface TagDAO {
    public Tag found(String name);

    public void create(Tag t);

    public List<Tag> listTag();
    public Tag findTag(int id);
    public void del(int idTag);
}
