package com.ht.service;

import com.ht.bean.Reply;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.ReplyDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by CSWangBin on 2017/3/10.
 */
@Service
public class ReplyServiceImpl implements ReplyService {

    @Resource
    private ReplyDAO replyDAO;

    @Override
    public int insert(Reply reply) {
        return replyDAO.insert(reply);
    }

    @Override
    public int delete(Reply reply) {
        return replyDAO.delete(reply);
    }

    @Override
    public int deleteById(Integer id) {
        return replyDAO.deleteById(id);
    }

    @Override
    public int update(Reply reply) {
        return replyDAO.update(reply);
    }

    @Override
    public List<Reply> queryAll() {
        return replyDAO.queryAll();
    }

    @Override
    public Reply query(Reply reply) {
        return replyDAO.query(reply);
    }

    @Override
    public Reply queryById(Integer id) {
        return replyDAO.queryById(id);
    }


    @Override
    public List<Reply> queryByPager(Pager4EasyUI<Reply> pager, Reply reply) {
        return replyDAO.queryByPager(pager, reply);
    }

    @Override
    public int count() {
        return replyDAO.count();
    }
}
