package com.ht.service;

import com.ht.bean.NoticeInfo;
import com.ht.common.bean.Pager4EasyUI;

import java.util.List;

/**
 * 公告分页 service
 * Created by Zhangwenxing on 2017/2/24.
 */
public interface NoticeInfoService{
    public List<NoticeInfo> queryByPager(Pager4EasyUI<NoticeInfo> pager, NoticeInfo noticeInfo);
    public int count();
    public List<NoticeInfo> queryByIndex();
}
