package com.ht.service;

import com.ht.bean.Photo;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.PhotoDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/2/24.
 */
@Service
public class PhotoServiceImpl implements PhotoService {

    @Resource
    private PhotoDAO photoDAO;

    @Override
    public int insert(Photo photo) {
        return photoDAO.insert(photo);
    }

    @Override
    public int delete(Photo photo) {
        return photoDAO.delete(photo);
    }

    @Override
    public int deleteById(String id) {
        return photoDAO.deleteById(id);
    }

    @Override
    public int update(Photo photo) {
        return photoDAO.update(photo);
    }

    @Override
    public List<Photo> queryAll() {
        return photoDAO.queryAll();
    }

    @Override
    public Photo query(Photo photo) {
        return photoDAO.query(photo);
    }

    @Override
    public Photo queryById(String id) {
        return photoDAO.queryById(id);
    }

    @Override
    public List<Photo> queryByPager(Pager4EasyUI<Photo> pager, Photo photo) {
        return null;
    }

    @Override
    public int count() {
        return photoDAO.count();
    }

    @Override
    public List<Photo> queryByRandom() {
        return photoDAO.queryByRandom();
    }

    @Override
    public Photo queryByRandomNotId(int id) {
        return photoDAO.queryByRandomNotId(id);
    }
}
