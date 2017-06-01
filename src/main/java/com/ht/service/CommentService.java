package com.ht.service;

import com.ht.bean.Comment;
import com.ht.bean.Matter;
import com.ht.bean.Reply;
import com.ht.common.bean.Pager;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 举 on 2017/2/28.
 */

public interface CommentService extends BaseService<Comment, Integer> {


    /**
     * 动态分页查询
     * @param pager
     * @param comment
     * @return
     */
    public List<Comment> queryByPagerAndCriteria (Pager pager, Comment comment);

    /**
     * 计算动态总数
     * @param comment
     * @return
     */
    public int countByCriteria(Comment comment);

    /**
     * 动态和评论表关联查询
     * @return
     */
    public List<Comment> queryCM();


    /**
     * 查看动态里面的所有的回复
     */
    public List<Comment> queryByCMId(int id);
}
