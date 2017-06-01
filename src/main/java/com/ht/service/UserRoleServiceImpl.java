package com.ht.service;

import com.ht.bean.UserRole;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.UserRoleDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by xiao-kang on 2017/3/11.
 */
@Service
public class UserRoleServiceImpl implements UserRoleService{

    @Resource
    private UserRoleDAO userRoleDAO;

    @Override
    public int insert(UserRole userRole) {
        return userRoleDAO.insert(userRole);
    }

    @Override
    public int delete(UserRole userRole) {
        return 0;
    }

    @Override
    public int deleteById(Integer id) {
        return 0;
    }

    @Override
    public int update(UserRole userRole) {
        return userRoleDAO.update(userRole);
    }

    @Override
    public List<UserRole> queryAll() {
        return null;
    }

    @Override
    public UserRole query(UserRole userRole) {
        return null;
    }

    @Override
    public UserRole queryById(Integer id) {
        return null;
    }

    @Override
    public List<UserRole> queryByPager(Pager4EasyUI<UserRole> pager, UserRole userRole) {
        return null;
    }

    @Override
    public int count() {
        return 0;
    }

    @Override
    public UserRole queryByUserId(int userId) {
        return userRoleDAO.queryByUserId(userId);
    }
}
