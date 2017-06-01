package com.ht.service;

import com.ht.bean.Grade;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.GradeDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by xiao-kang on 2017/2/25.
 */
@Service
public class GradeServiceImpl implements GradeService {

    @Resource
    private GradeDAO gradeDAO;

    @Override
    public int insert(Grade grade) {
        return 0;
    }

    @Override
    public int delete(Grade grade) {
        return 0;
    }

    @Override
    public int deleteById(Integer id) {
        return 0;
    }

    @Override
    public int update(Grade grade) {
        return gradeDAO.update(grade);
    }

    @Override
    public List<Grade> queryAll() {
        return gradeDAO.queryAll();
    }

    @Override
    public Grade query(Grade grade) {
        return null;
    }

    @Override
    public Grade queryById(Integer id) {
        return gradeDAO.queryById(id);
    }

    @Override
    public List<Grade> queryByPager(Pager4EasyUI<Grade> pager, Grade grade) {
        return null;
    }

    @Override
    public int count() {
        return 0;
    }
}
