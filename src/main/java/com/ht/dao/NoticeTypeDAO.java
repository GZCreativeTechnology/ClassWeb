package com.ht.dao;

import com.ht.bean.NoticeType;
import com.ht.common.bean.Pager4EasyUI;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 公告类型dao
 * Created by Zhangwenxing on 2017/2/24.
 */
@Repository
public interface NoticeTypeDAO extends BaseDAO<NoticeType, Integer>{
    @Override
    List<NoticeType> queryByPager(@Param("pager") Pager4EasyUI<NoticeType> pager, @Param("noticeType") NoticeType noticeType);
}
