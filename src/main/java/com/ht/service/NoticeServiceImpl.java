package com.ht.service;

import com.ht.bean.Notice;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.NoticeDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 公告 serviceImpl
 * Created by Zhangwenxing on 2017/2/24.
 */
@Service
public class NoticeServiceImpl implements NoticeService{
    @Resource
    private NoticeDAO nd;

    @Override
    public int insert(Notice notice) {
        return nd.insert(notice);
    }

    @Override
    public int delete(Notice notice) {
        return nd.delete(notice);
    }

    @Override
    public int deleteById(Integer id) {
        return nd.deleteById(id);
    }

    @Override
    public int update(Notice notice) {
        return nd.update(notice);
    }

    @Override
    public List<Notice> queryAll() {
        return nd.queryAll();
    }

    @Override
    public Notice query(Notice notice) {
        return nd.query(notice);
    }

    @Override
    public Notice queryById(Integer id) {
        return nd.queryById(id);
    }

    @Override
    public List<Notice> queryByPager(Pager4EasyUI<Notice> pager, Notice notice) {
        return nd.queryByPager(pager, notice);
    }

    @Override
    public int count() {
        return nd.count();
    }
}
