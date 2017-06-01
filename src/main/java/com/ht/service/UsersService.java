package com.ht.service;

import com.ht.bean.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by xiao-kang on 2017/2/27.
 */
public interface UsersService extends BaseService<Users,Integer> {
    /**
     * 根据手机号查询用户信息
     * @param phone
     * @return
     */
    public Users queryByPhone(@Param("phone") String phone);

    /**
     * 查询所有成员但不会查询自己
     * @
     * @return
     */
    public List<Users> queryAll(int  sessionId);
    public void editPwd(Users user);
}
