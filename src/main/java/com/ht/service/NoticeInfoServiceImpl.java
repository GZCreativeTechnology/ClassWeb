package com.ht.service;

import com.ht.bean.NoticeInfo;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.NoticeInfoDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 公告分页 serviceImpl
 * Created by Zhangwenxing on 2017/2/24.
 */
@Service
public class NoticeInfoServiceImpl implements NoticeInfoService{
    @Resource
    private NoticeInfoDAO nd;
    @Override
    public int count() {
        return nd.count();
    }

    @Override
    public List<NoticeInfo> queryByPager(Pager4EasyUI<NoticeInfo> pager, NoticeInfo noticeInfo) {
        return nd.queryByPager(pager, noticeInfo);
    }

    @Override
    public List<NoticeInfo> queryByIndex(){
        return nd.queryByIndex();
    }
}
