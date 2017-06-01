package com.ht.service;

import com.ht.bean.Photo;

import java.util.List;

/**
 * Created by Administrator on 2017/2/24.
 */
public interface PhotoService extends BaseService<Photo, String> {
    /**
     * 随机查询10条数据
     * @return
     */
    public List<Photo> queryByRandom();
}
