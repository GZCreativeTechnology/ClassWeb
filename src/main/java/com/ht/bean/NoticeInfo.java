package com.ht.bean;

import java.util.Date;

/**
 * 公告Info Bean
 * Created by Zhangwenxing on 2017/2/27.
 */
public class NoticeInfo {
    private int noticeId; //公告id
    private String name;// 公告名称
    private String des;// 公告描述
    private Date noticeDay;// 公告时间
    private int status;// 公告状态
    private int noticeTypeId; // 公告类型id
    private String noticeTypeName; //公告名称
    private int userId; // 用户id
    private String userName; //用户名称
    private String userHead; //用户头像

    public String getUserHead() {
        return userHead;
    }

    public void setUserHead(String userHead) {
        this.userHead = userHead;
    }

    public int getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(int noticeId) {
        this.noticeId = noticeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public Date getNoticeDay() {
        return noticeDay;
    }

    public void setNoticeDay(Date noticeDay) {
        this.noticeDay = noticeDay;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getNoticeTypeId() {
        return noticeTypeId;
    }

    public void setNoticeTypeId(int noticeTypeId) {
        this.noticeTypeId = noticeTypeId;
    }

    public String getNoticeTypeName() {
        return noticeTypeName;
    }

    public void setNoticeTypeName(String noticeTypeName) {
        this.noticeTypeName = noticeTypeName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "NoticeInfo{" +
                "noticeId=" + noticeId +
                ", name='" + name + '\'' +
                ", des='" + des + '\'' +
                ", noticeDay=" + noticeDay +
                ", status=" + status +
                ", noticeTypeId=" + noticeTypeId +
                ", noticeTypeName='" + noticeTypeName + '\'' +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                '}';
    }
}
