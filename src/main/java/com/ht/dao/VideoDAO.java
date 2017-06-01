package com.ht.dao;

import com.ht.bean.Notice;
import com.ht.bean.Video;
import com.ht.common.bean.Pager4EasyUI;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/2/24.
 */
@Repository
public interface VideoDAO extends BaseDAO<Video, String> {

    @Override
    List<Video> queryByPager(@Param("pager") Pager4EasyUI<Video> pager, @Param("video") Video video);
}
