package com.ht.service;

import com.ht.bean.Matter;
import com.ht.common.bean.Pager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 举 on 2017/2/26.
 */
public interface MatterService extends BaseService<Matter, Integer> {

    /**
     * 动态分页查询
     * @param pager
     * @param matter
     * @return
     */
    public List<Matter> queryByPagerAndCriteria (Pager pager, Matter matter);

    /**
     * 计算动态总数
     * @param matter
     * @return
     */
    public int countByCriteria(Matter matter);

    /**
     * 动态和评论表关联
     * @return
     */
    public List<Matter> queryMC(int id);

}
