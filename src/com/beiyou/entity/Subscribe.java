package com.beiyou.entity;

import java.util.Date;

public class Subscribe {
    /*`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `school` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `major` varchar(100) NOT NULL,
  `isshow` enum('y','n') DEFAULT 'n',
  `stime` datetime DEFAULT NULL,*/

    private int id;
    private String name;
    private String school;
    private String phone;
    private String major;
    private String isshow;
    private Date stime;

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

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getIsshow() {
        return isshow;
    }

    public void setIsshow(String isshow) {
        this.isshow = isshow;
    }

    public Date getStime() {
        return stime;
    }

    public void setStime(Date stime) {
        this.stime = stime;
    }
}
