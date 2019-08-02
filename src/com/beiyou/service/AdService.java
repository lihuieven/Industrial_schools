package com.beiyou.service;

import com.beiyou.dao.AdDao;
import com.beiyou.entity.Ad;
import com.beiyou.entity.PageBean;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class AdService{
    private AdDao adDao = new AdDao();
    //查询已开放轮播图
    public List<Ad> findAdList() {
        List<Ad> adList = null;
        try{
            adList = adDao.fingAdList();
        }catch (Exception e){
            e.printStackTrace();
        }
        return adList;
    }

    //查询所有轮播图
    public PageBean findAdAllList(int currentPage, int currentCount) {
        PageBean<Ad> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setCurrentCount(currentCount);
        int totalCount = 0;
        try {
             totalCount = adDao.fingAdAllCount();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setTotalCount(totalCount);
        if(totalCount%currentCount==0){
            pageBean.setTotalPage(totalCount/currentCount);
        }else{
            pageBean.setTotalPage(totalCount/currentCount+1);
        }
        int index = (currentPage-1) *currentCount;
        List<Ad> adList = null;
        try {
            adList = adDao.fingAdAllList(index,currentCount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        pageBean.setList(adList);
        return pageBean;
    }

    //写入轮播图
    public boolean insertAdAdd(String title,String url,String img) {

        int i = 0;
        try {
            i = adDao.insertAdAdd(title,url,img);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return i>0?true:false;
    }

    //删除轮播图
    public void deleteAd(String id) {
        try {
            adDao.deleteAd(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //修改轮播图
    public void editorAd(String id,String title,String url) {
        try {
            adDao.editorAd(id,title,url);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //根据id查询轮播图
    public Ad findAdId(String id) {
        try {
            return adDao.findAdId(id);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
