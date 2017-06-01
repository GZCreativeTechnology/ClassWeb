package com.ht.service;

import com.ht.bean.Written;
import com.ht.common.bean.Pager;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.WrittenDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by xiao-kang on 2017/2/27.
 */
@Service
public class WrittenServiceImpl implements WrittenService{

    @Resource
    private WrittenDAO writtenDAO;
    @Override
    public int insert(Written written) {
        return writtenDAO.insert(written);
    }

    @Override
    public int delete(Written written) {
        return 0;
    }

    @Override
    public int deleteById(Integer id) {
        return writtenDAO.deleteById(id);
    }

    @Override
    public int update(Written written) {
        return 0;
    }

    @Override
    public List<Written> queryAll() {
        return null;
    }

    @Override
    public Written query(Written written) {
        return null;
    }

    @Override
    public Written queryById(Integer id) {
        return null;
    }

    @Override
    public List<Written> queryByPager(Pager4EasyUI<Written> pager, Written written) {
        return writtenDAO.queryByPager(pager,written);
    }

    @Override
    public int count() {
        return writtenDAO.count();
    }

    @Override
    public List<Written> queryPager(Pager pager) {
        return writtenDAO.queryPager(pager);
    }
}
