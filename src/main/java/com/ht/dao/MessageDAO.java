package com.ht.dao;

import com.ht.bean.Message;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 消息dao
 * Created by Zhangwenxing on 2017/2/24.
 */
@Repository
public interface MessageDAO extends BaseDAO<Message, Integer>{
    public List<Message> queryAllList(int id);
    public List<Message> queryAllListByStatus(int id);
    public void updateAll(int id);
}
