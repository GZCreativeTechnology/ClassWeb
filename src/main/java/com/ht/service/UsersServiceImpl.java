package com.ht.service;

import com.ht.bean.Users;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.UsersDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by xiao-kang on 2017/2/27.
 */
@Service
public class UsersServiceImpl implements UsersService {

    @Resource
    private UsersDAO usersDAO;

    @Override
    public int insert(Users users) {
        return usersDAO.insert(users);
    }

    @Override
    public int delete(Users users) {
        return 0;
    }

    @Override
    public int deleteById(Integer id) {
        return 0;
    }

    @Override
    public int update(Users users) {
        return usersDAO.update(users);
    }

    @Override
    public List<Users> queryAll() {
        return null;
    }

    @Override
    public List<Users> queryAll(int sessionId) {
        return usersDAO.queryAll(sessionId);
    }

    @Override
    public Users query(Users users) {
        return null;
    }

    @Override
    public Users queryById(Integer id) {
        return usersDAO.queryById(id);
    }

    @Override
    public List<Users> queryByPager(Pager4EasyUI<Users> pager, Users users) {
        return null;
    }

    @Override
    public int count() {
        return 0;
    }

    @Override
    public Users queryByPhone(String phone) {
        return usersDAO.queryByPhone(phone);
    }

    @Override
    public void editPwd(Users user) {
        usersDAO.editPwd(user);
    }
}
