package com.beiyou.service;

import com.beiyou.dao.SubscribeDao;
import com.beiyou.entity.PageBean;
import com.beiyou.entity.Subscribe;

import java.sql.SQLException;
import java.util.List;

public class SubscribeService {
    private SubscribeDao subscribeDao = new SubscribeDao();
    //查询预约成功用户
    public List<Subscribe> findYesList() {
        List<Subscribe> subscribeList = null;
        try {
            subscribeList = subscribeDao.findYesList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return subscribeList;
    }

    //查询所有预约用户
    public PageBean findAllList(int currentPage, int currentCount) {
        PageBean<Subscribe> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setCurrentCount(currentCount);
        int totalCount = 0;
        try {
            totalCount = subscribeDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setTotalCount(totalCount);
        if(totalCount%currentCount==0){
            pageBean.setTotalPage(totalCount/currentCount);
        }else{
            pageBean.setTotalPage(totalCount/currentCount+1);
        }
        int index = (currentPage-1)*currentCount;
        List<Subscribe> subscribeList = null;
        try {
            subscribeList = subscribeDao.findAllList(index,currentCount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        pageBean.setList(subscribeList);
        return pageBean;
    }

    //写入预约用户
    public boolean regist(Subscribe subscribe) {
        int row = 0;
        try {
            row = subscribeDao.regist(subscribe);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row > 0 ? true : false;
    }

    //删除预约用户（id）
    public void deleteId(int id) {
        try {
            subscribeDao.deleteId(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //修改预约用户状态
    public void subscribeUpdateId(int id) {
        try {
            subscribeDao.subscribeUpdateId(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}