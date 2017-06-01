package com.ht.bean;

/**
 * 公告类型bean
 * Created by Zhangwenxing on 2017/2/24.
 */
public class NoticeType {
    private int id; // 公告类型id
    private String name; // 公告类型名称
    private String des;// 公告类型描述
    private int status;// 公告类型状态

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "NoticeType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", des='" + des + '\'' +
                ", status=" + status +
                '}';
    }
}
