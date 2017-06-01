package com.ht.service;

import com.ht.bean.Comment;
import com.ht.bean.Reply;
import com.ht.common.bean.Pager;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.dao.CommentDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 举 on 2017/2/28.
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentDAO commentDAO;

    @Override
    public List<Comment> queryByPagerAndCriteria(Pager pager, Comment comment) {
        return commentDAO.queryByPagerAndCriteria(pager, comment);
    }

    @Override
    public int countByCriteria(Comment comment) {
        return commentDAO.countByCriteria(comment);
    }

    @Override
    public List<Comment> queryCM() {
        return commentDAO.queryCM();
    }

    @Override
    public List<Comment> queryByCMId(int id) {
        return commentDAO.queryByCMId(id);
    }

    @Override
    public int insert(Comment comment) {
        return commentDAO.insert(comment);
    }

    @Override
    public int delete(Comment comment) {
        return commentDAO.delete(comment);
    }

    @Override
    public int deleteById(Integer id) {
        return commentDAO.deleteById(id);
    }

    @Override
    public int update(Comment comment) {
        return commentDAO.update(comment);
    }

    @Override
    public List<Comment> queryAll() {
        return commentDAO.queryAll();
    }

    @Override
    public Comment query(Comment comment) {
        return commentDAO.query(comment);
    }

    @Override
    public Comment queryById(Integer id) {
        return commentDAO.queryById(id);
    }

    @Override
    public List<Comment> queryByPager(Pager4EasyUI<Comment> pager, Comment comment) {
        return commentDAO.queryByPager(pager, comment);
    }

    @Override
    public int count() {
        return commentDAO.count();
    }
}
