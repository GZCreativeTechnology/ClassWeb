package com.ht.dao;

import com.ht.bean.Photo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/2/24.
 */
@Repository
public interface PhotoDAO extends BaseDAO<Photo, String> {

    /**
     * 随机查询10条数据
     * @return
     */
    public List<Photo> queryByRandom();
}
