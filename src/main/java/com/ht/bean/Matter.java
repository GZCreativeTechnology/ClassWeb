package com.ht.bean;

import java.util.Date;
import java.util.List;

/**
 * Created by 举 on 2017/2/26.
 */
public class Matter {
    private int id;  //动态id
    private String title;//动态标题
    private String des;//动态描述
    private int userId;//发布人
    private Date createTime;//创建时间
    private int status; //动态的状态
    private int sessionId;
    private List<Comment> comments;

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Matter{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", des='" + des + '\'' +
                ", userId=" + userId +
                ", createTime=" + createTime +
                ", status=" + status +
                '}';
    }
}
