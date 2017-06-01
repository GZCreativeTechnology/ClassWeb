package com.ht.dao;

import com.ht.bean.Notice;
import com.ht.common.bean.Pager4EasyUI;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 公告dao
 * Created by Zhangwenxing on 2017/2/24.
 */
@Repository
public interface NoticeDAO extends BaseDAO<Notice, Integer>{
    @Override
    List<Notice> queryByPager(@Param("pager") Pager4EasyUI<Notice> pager, @Param("notice") Notice notice);
}
