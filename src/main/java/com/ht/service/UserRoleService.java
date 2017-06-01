package com.ht.service;

import com.ht.bean.UserRole;

/**
 * Created by xiao-kang on 2017/3/11.
 */
public interface UserRoleService extends BaseService<UserRole,Integer> {

    public UserRole queryByUserId(int userId);
}
