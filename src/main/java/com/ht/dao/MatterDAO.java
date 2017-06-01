package com.ht.dao;

import com.ht.bean.Comment;
import com.ht.bean.Matter;
import com.ht.bean.Users;
import com.ht.common.bean.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 举 on 2017/2/26.
 */
@Repository
public interface MatterDAO extends BaseDAO<Matter,Integer> {

    /**
     * 动态分页查询
     * @param pager
     * @param matter
     * @return
     */
    public List<Matter> queryByPagerAndCriteria(@Param("pager") Pager pager,
                                                @Param("matter") Matter matter);

    /**
     * 计算动态总数
     * @param matter
     * @return
     */
    public int countByCriteria(@Param("matter") Matter matter);

    /**
     * 动态和评论表关联
     * @return
     */
    public List<Matter> queryMC(int id);
}
