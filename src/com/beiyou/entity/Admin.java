package com.beiyou.entity;

public class Admin {
     /* `account` varchar(100) NOT NULL,
  `passwd` varchar(100) NOT NULL,
  `tname` varchar(100) NOT NULL,
  `face` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `num` int(10) unsigned DEFAULT '0',*/
     private String account;
     private String passwd;
     private String tname;
     private String face;
     private String phone;
     private int num;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getFace() {
        return face;
    }

    public void setFace(String face) {
        this.face = face;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
