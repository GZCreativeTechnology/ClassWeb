package com.ht.service;

import com.ht.bean.Video;
import com.ht.common.bean.Pager4EasyUI;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2017/2/24.
 */
public interface VideoService extends BaseService<Video, String> {
    @Override
    List<Video> queryByPager(@Param("pager") Pager4EasyUI<Video> pager, @Param("video") Video video);
}
