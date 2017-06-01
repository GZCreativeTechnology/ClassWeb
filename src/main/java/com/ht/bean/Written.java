package com.ht.bean;

import java.util.Date;

/**
 * Created by xiao-kang on 2017/2/24.
 */
public class Written {
    private int id;     // 留言ID
    private String des;  // 留言内容
    private Date  createTime;//  留言时间
    private Users user;       //  多条留言只能一个用户
    private int sessionId;

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }
}
