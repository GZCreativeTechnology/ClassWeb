package com.ht.service;

import com.ht.bean.Message;

import java.util.List;

/**
 * 消息service
 * Created by Zhangwenxing on 2017/2/24.
 */
public interface MessageService extends BaseService<Message, Integer>{
    public List<Message> queryAllList(int id);
    public List<Message> queryAllListByStatus(int id);
    public void updateAll(int id);
}
