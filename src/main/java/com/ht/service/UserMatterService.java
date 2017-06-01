package com.ht.service;

import com.ht.bean.UserMatter;
import com.ht.common.bean.Pager4EasyUI;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by CSWangBin on 2017/3/3.
 */
public interface UserMatterService {

    /**
     * 根据userId查询动态
     */
    public List<UserMatter> queryMyMatter(@Param("id")int id, @Param("pager") Pager4EasyUI<UserMatter> pager, @Param("userMatter") UserMatter userMatter);

    /**
     * 查询动态
     */
    public List<UserMatter> queryMatter(@Param("pager") Pager4EasyUI<UserMatter> pager, @Param("userMatter") UserMatter userMatter);

    /**
     * 主页动态
     */
    public List<UserMatter> queryMatterByIndex();

    public int count();
    public int myCount(int userId);
}
