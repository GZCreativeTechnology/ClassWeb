package com.ht.dao;

import com.ht.bean.Comment;
import com.ht.bean.Matter;
import com.ht.bean.Reply;
import com.ht.common.bean.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 举 on 2017/2/28.
 */
@Repository
public interface CommentDAO extends BaseDAO<Comment,Integer> {

    /**
     * 动态分页查询
     * @param pager
     * @param comment
     * @return
     */
    public List<Comment> queryByPagerAndCriteria(@Param("pager") Pager pager,
                                                @Param("comment") Comment comment);

    /**
     * 计算动态总数
     * @param comment
     * @return
     */
    public int countByCriteria(@Param("comment") Comment comment);

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
