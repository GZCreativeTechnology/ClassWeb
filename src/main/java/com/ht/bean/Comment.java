package com.ht.bean;

import java.util.Date;
import java.util.List;

/**
 * Created by 举 on 2017/2/26.
 */
public class Comment {
    private int id; //评论的主键
    private String des; //评论的描述
    private int userId; //评论的人
    private Date createTime; //评论的时间
    private int matterId; //动态的id
    private int status; //评论的状态
    private String userName; //info封装的属性， 数据库没有的 谁评论的名称
    private String userHead; //info封装的属性， 数据库没有的 谁评论的头像
    private Matter matter;
    private int sessionId;
    private List<Reply> replies;

    public List<Reply> getReplies() {
        return replies;
    }

    public void setReplies(List<Reply> replies) {
        this.replies = replies;
    }

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
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

    public Matter getMatter() {
        return matter;
    }

    public void setMatter(Matter matter) {
        this.matter = matter;
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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getMatterId() {
        return matterId;
    }

    public void setMatterId(int matterId) {
        this.matterId = matterId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
