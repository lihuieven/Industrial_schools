package com.beiyou.entity;

import java.util.Date;

public class News {
  private int id;
  private String title;
  private Date anow;
  private String nclass;
  private String content;
  private String img;
  private int atime;

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

  public Date getAnow() {
    return anow;
  }

  public void setAnow(Date anow) {
    this.anow = anow;
  }

  public String getNclass() {
    return nclass;
  }

  public void setNclass(String nclass) {
    this.nclass = nclass;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getImg() {
    return img;
  }

  public void setImg(String img) {
    this.img = img;
  }

  public int getAtime() {
    return atime;
  }

  public void setAtime(int atime) {
    this.atime = atime;
  }
}
