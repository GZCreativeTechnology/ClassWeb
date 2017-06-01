package com.ht.bean;

import java.util.List;

/**
 * Created by Administrator on 2017/2/15.
 */
public class Users {

    private int id;             // 用户ID
    private String head;        // 头像
    private String userName;    // 名称
    private String password;    // 密码
    private String phone;       // 手机号
    private String idCard;      // 身份证
    private String address;     // 地址
    private String qq;          // qq
    private String weChat;      // 微信
    private int age;            // 年龄
    private String birthday;    // 生日
    private String gender;      // 性别
    private String nation;      // 籍贯
    private String residence;    // 户口性质
    private String parentName;     // 家长名称
    private String parentPhone;     // 家长手机
    private String des;             // 描述
    private int status;             //状态
    private int roleId;             // 角色ID
    private List<Written> writtens; // 一个用户有多条留言


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getWeChat() {
        return weChat;
    }

    public void setWeChat(String weChat) {
        this.weChat = weChat;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getResidence() {
        return residence;
    }

    public void setResidence(String residence) {
        this.residence = residence;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getParentPhone() {
        return parentPhone;
    }

    public void setParentPhone(String parentPhone) {
        this.parentPhone = parentPhone;
    }

    public List<Written> getWrittens() {
        return writtens;
    }

    public void setWrittens(List<Written> writtens) {
        this.writtens = writtens;
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

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "Users{" +
                "id=" + id +
                ", head='" + head + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", idCard='" + idCard + '\'' +
                ", address='" + address + '\'' +
                ", qq='" + qq + '\'' +
                ", weChat='" + weChat + '\'' +
                ", age=" + age +
                ", birthday='" + birthday + '\'' +
                ", gender='" + gender + '\'' +
                ", nation='" + nation + '\'' +
                ", residence='" + residence + '\'' +
                ", parentName='" + parentName + '\'' +
                ", parentPhone='" + parentPhone + '\'' +
                '}';
    }
}
