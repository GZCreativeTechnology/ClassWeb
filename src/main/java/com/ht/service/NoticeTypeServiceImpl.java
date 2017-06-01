package com.ht.service;

import com.ht.bean.NoticeType;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.NoticeTypeDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 公告类型serviceImpl
 * Created by Zhangwenxing on 2017/2/24.
 */
@Service
public class NoticeTypeServiceImpl implements NoticeTypeService{
    @Resource
    private NoticeTypeDAO ntd;

    @Override
    public int insert(NoticeType noticeType) {
        return ntd.insert(noticeType);
    }

    @Override
    public int delete(NoticeType noticeType) {
        return ntd.delete(noticeType);
    }

    @Override
    public int deleteById(Integer id) {
        return ntd.deleteById(id);
    }

    @Override
    public int update(NoticeType noticeType) {
        return ntd.update(noticeType);
    }

    @Override
    public List<NoticeType> queryAll() {
        return ntd.queryAll();
    }

    @Override
    public NoticeType query(NoticeType noticeType) {
        return ntd.query(noticeType);
    }

    @Override
    public NoticeType queryById(Integer id) {
        return ntd.queryById(id);
    }

    @Override
    public List<NoticeType> queryByPager(Pager4EasyUI<NoticeType> pager, NoticeType noticeType) {
        return ntd.queryByPager(pager, noticeType);
    }

    @Override
    public int count() {
        return ntd.count();
    }
}
