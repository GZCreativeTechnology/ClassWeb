package com.ht.dao;

import com.ht.bean.UserRole;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by xiao-kang on 2017/3/11.
 */
@Repository
public interface UserRoleDAO extends  BaseDAO<UserRole,Integer> {

    public UserRole queryByUserId(@Param("userId") int userId);
}
