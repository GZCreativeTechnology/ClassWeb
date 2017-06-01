package com.ht.bean;

/**
 * Created by xiao-kang on 2017/2/24.
 */
public class Grade {
    private int id;  // 班级ID
    private String name; // 班级名称
    private String des;  // 班级描述
    private String logo; // 班级logo
    private int count;     // 班级人数
    private int userId;     // 班主任

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

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Grade{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", des='" + des + '\'' +
                ", logo='" + logo + '\'' +
                ", count=" + count +
                '}';
    }
}
