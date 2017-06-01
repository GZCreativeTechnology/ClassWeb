package com.ht.bean;

import java.util.Date;

/**
 * 消息Bean
 * Created by Zhangwenxing on 2017/3/9.
 */
public class Message {
    private int id; // 消息id
    private int toUser; // 发送者id
    private String foUserName;
    private String foUserHead;
    private int foUser; // 接受者id
    private int matterId; // 动态id
    private String matterTitle;
    private String matterDes;
    private Date createTime; // 创建时间
    private String des; // 消息描述
    private int status; // 消息状态

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getToUser() {
        return toUser;
    }

    public void setToUser(int toUser) {
        this.toUser = toUser;
    }

    public int getFoUser() {
        return foUser;
    }

    public void setFoUser(int foUser) {
        this.foUser = foUser;
    }

    public int getMatterId() {
        return matterId;
    }

    public void setMatterId(int matterId) {
        this.matterId = matterId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMatterTitle() {
        return matterTitle;
    }

    public void setMatterTitle(String matterTitle) {
        this.matterTitle = matterTitle;
    }

    public String getMatterDes() {
        return matterDes;
    }

    public void setMatterDes(String matterDes) {
        this.matterDes = matterDes;
    }

    public String getFoUserName() {
        return foUserName;
    }

    public void setFoUserName(String foUserName) {
        this.foUserName = foUserName;
    }

    public String getFoUserHead() {
        return foUserHead;
    }

    public void setFoUserHead(String foUserHead) {
        this.foUserHead = foUserHead;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", toUser=" + toUser +
                ", foUserName='" + foUserName + '\'' +
                ", foUserHead='" + foUserHead + '\'' +
                ", foUser=" + foUser +
                ", matterId=" + matterId +
                ", matterTitle='" + matterTitle + '\'' +
                ", matterDes='" + matterDes + '\'' +
                ", createTime=" + createTime +
                ", des='" + des + '\'' +
                ", status=" + status +
                '}';
    }
}
