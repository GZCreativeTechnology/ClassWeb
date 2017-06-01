package com.ht.bean;

import java.util.Date;

/**
 * 公告bean
 * Created by Zhangwenxing on 2017/2/24.
 */
public class Notice {
    private int noticeId; //公告id
    private String name;// 公告名称
    private String des;// 公告描述
    private Date noticeDay;// 公告时间
    private int status;// 公告状态
    private int userId; // 用户id
    private int noticeTypeId; // 公告id

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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getNoticeTypeId() {
        return noticeTypeId;
    }

    public void setNoticeTypeId(int noticeTypeId) {
        this.noticeTypeId = noticeTypeId;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "noticeId=" + noticeId +
                ", name='" + name + '\'' +
                ", des='" + des + '\'' +
                ", noticeDay=" + noticeDay +
                ", status=" + status +
                '}';
    }
}

