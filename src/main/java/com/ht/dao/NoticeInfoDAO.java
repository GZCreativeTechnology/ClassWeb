package com.ht.dao;

import com.ht.bean.NoticeInfo;
import com.ht.common.bean.Pager4EasyUI;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 公告Info dao
 * Created by Zhangwenxing on 2017/2/24.
 */
@Repository
public interface NoticeInfoDAO extends BaseDAO<NoticeInfo, Integer>{
    @Override
    List<NoticeInfo> queryByPager(@Param("pager") Pager4EasyUI<NoticeInfo> pager, @Param("noticeInfo") NoticeInfo noticeInfo);
    public List<NoticeInfo> queryByIndex();
}
