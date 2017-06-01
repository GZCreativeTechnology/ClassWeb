package com.ht.service;

import com.ht.bean.Message;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.MessageDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 消息ServiceImpl
 * Created by Zhangwenxing on 2017/2/24.
 */
@Service
public class MessageServiceImpl implements MessageService{
    @Resource
    private MessageDAO md;

    @Override
    public int insert(Message message) {
        return md.insert(message);
    }

    @Override
    public int delete(Message message) {
        return 0;
    }

    @Override
    public int deleteById(Integer id) {
        return 0;
    }

    @Override
    public int update(Message message) {
        return 0;
    }

    @Override
    public List<Message> queryAll() {
        return md.queryAll();
    }

    @Override
    public Message query(Message message) {
        return null;
    }

    @Override
    public Message queryById(Integer id) {
        return md.queryById(id);
    }

    @Override
    public List<Message> queryByPager(Pager4EasyUI<Message> pager, Message message) {
        return md.queryByPager(pager, message);
    }

    @Override
    public int count() {
        return 0;
    }

    @Override
    public List<Message> queryAllList(int id) {
        return md.queryAllList(id);
    }

    @Override
    public List<Message> queryAllListByStatus(int id) {
        return md.queryAllListByStatus(id);
    }

    @Override
    public void updateAll(int id) {
        md.updateAll(id);
    }
}
