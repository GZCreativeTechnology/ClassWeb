package com.ht.bean;

import java.util.Date;

/**
 * Created by 举 on 2017/2/26.
 */
public class Reply {
    private int id; //回复id
    private int userId; //回复人
    private String des; //评论内容
    private int commentId; //评论id
    private Date createTime; //创建时间
    private String userName; //用户名字（数据库没有的字段）
    private String userHead; //用户头像（数据库没有的字段）
    private int status;//回复状态
    private String sessionHead;
    private int sessionId;
    private int matterUserId;
    private int matterId;
    private int roleId;

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getMatterId() {
        return matterId;
    }

    public void setMatterId(int matterId) {
        this.matterId = matterId;
    }

    public int getMatterUserId() {
        return matterUserId;
    }

    public void setMatterUserId(int matterUserId) {
        this.matterUserId = matterUserId;
    }

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public String getSessionHead() {
        return sessionHead;
    }

    public void setSessionHead(String sessionHead) {
        this.sessionHead = sessionHead;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserHead() {
        return userHead;
    }

    public void setUserHead(String userHead) {
        this.userHead = userHead;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
