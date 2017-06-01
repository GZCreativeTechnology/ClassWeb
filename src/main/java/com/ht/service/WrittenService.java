package com.ht.service;

import com.ht.bean.Written;
import com.ht.common.bean.Pager;

import java.util.List;

/**
 * Created by xiao-kang on 2017/2/27.
 */
public interface WrittenService extends BaseService<Written,Integer> {
    public List<Written> queryPager(Pager pager);
}
