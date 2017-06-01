package com.ht.service;

import com.ht.bean.Video;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.VideoDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/2/24.
 */
@Service
public class VideoServiceImpl implements VideoService {

    @Resource
    private VideoDAO videoDAO;

    @Override
    public int insert(Video video) {
        return videoDAO.insert(video);
    }

    @Override
    public int delete(Video video) {
        return videoDAO.delete(video);
    }

    @Override
    public int deleteById(String id) {
        return videoDAO.deleteById(id);
    }

    @Override
    public int update(Video video) {
        return videoDAO.update(video);
    }

    @Override
    public List<Video> queryAll() {
        return videoDAO.queryAll();
    }

    @Override
    public Video query(Video video) {
        return videoDAO.query(video);
    }

    @Override
    public Video queryById(String id) {
        return videoDAO.queryById(id);
    }

    @Override
    public List<Video> queryByPager(Pager4EasyUI<Video> pager, Video video) {
        return videoDAO.queryByPager(pager, video);
    }

    @Override
    public int count() {
        return videoDAO.count();
    }
}
