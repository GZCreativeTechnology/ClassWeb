package com.ht.dao;

import com.ht.common.bean.Pager4EasyUI;

import java.io.Serializable;
import java.util.List;

/**
 * Created by WangGenshen on 5/16/16.
 */
public interface BaseDAO<T, PK extends Serializable> {

    public int insert(T t);
    public int delete(T t);
    public int deleteById(PK id);
    public int update(T t);
    public List<T> queryAll();
    public T query(T t);
    public T queryById(PK id);
    public List<T> queryByPager(Pager4EasyUI<T> pager, T t);
    public int count();

}
