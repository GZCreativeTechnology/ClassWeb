package com.ht.dao;

import com.ht.bean.Written;
import com.ht.common.bean.Pager;
import com.ht.common.bean.Pager4EasyUI;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 * Created by xiao-kang on 2017/2/27.
 */
@Repository
public interface WrittenDAO extends BaseDAO<Written,Integer>{
     public List<Written> queryPager(@Param("pager")Pager pager);
}
