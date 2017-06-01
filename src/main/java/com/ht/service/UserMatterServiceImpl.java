package com.ht.service;

import com.ht.bean.UserMatter;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.UserMatterDAO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by CSWangBin on 2017/3/3.
 */
@Service
public class UserMatterServiceImpl implements UserMatterService {

    @Resource
    private UserMatterDAO userMatterDAO;
    @Override
    public List<UserMatter> queryMyMatter(@Param("id")int id, @Param("pager") Pager4EasyUI<UserMatter> pager, @Param("userMatter") UserMatter userMatter) {
        return userMatterDAO.queryMyMatter(id, pager, userMatter);
    }

    @Override
    public List<UserMatter> queryMatter(@Param("pager") Pager4EasyUI<UserMatter> pager, @Param("userMatter") UserMatter userMatter) {
        return userMatterDAO.queryMatter(pager, userMatter);
    }

    @Override
    public List<UserMatter> queryMatterByIndex() {
        return userMatterDAO.queryMatterByIndex();
    }

    @Override
    public int count() {
        return userMatterDAO.count();
    }

    @Override
    public int myCount(int userId) {
        return userMatterDAO.myCount(userId);
    }
}
