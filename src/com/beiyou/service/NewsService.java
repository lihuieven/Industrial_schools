package com.beiyou.service;

import com.beiyou.dao.NewsDao;
import com.beiyou.entity.News;
import com.beiyou.entity.PageBean;

import java.sql.SQLException;
import java.util.List;

public class NewsService {
    private NewsDao dao = new NewsDao();
    News news = new News();

    //获取学校新闻
    public List<News> findSchoolNewList() {
        List<News> schoolNewsList = null;
        try {
            schoolNewsList = dao.findSchoolNewsList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return schoolNewsList;
    }

    //获取行业新闻
    public List<News> findindustryNewsList() {
        List<News> industryNewsList = null;
        try {
            industryNewsList = dao.findindustryNewsList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return industryNewsList;
    }

    public List<News> findNews() {
        List<News> newsList = null;
        try {
            newsList = dao.findNews();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }

    public void deleteNews(int id) {
        try {
            dao.deleteNews(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //新闻分页查询
    public PageBean findNewsListCount(int currentPage, int currentCount) {
        PageBean<News> pageBean = new PageBean<>();
        //封装当前页
        pageBean.setCurrentPage(currentPage);
        //封装每页显示的条数
        pageBean.setCurrentCount(currentCount);
        //封装总条数
        int totalCount = 0;
        try {
            totalCount = dao.findNewsCount();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setTotalCount(totalCount);
        if(totalCount%currentCount==0){
            pageBean.setTotalPage(totalCount/currentCount);
        }else{
            pageBean.setTotalPage(totalCount/currentCount+1);
        }
        //当前页显示的数据
        int index = (currentPage - 1) * currentCount;
        List<News> list = null;
        try {
            list = dao.findNewsList(index,currentCount);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setList(list);
        return pageBean;
    }

    //分类查询所有新闻
    public List<News> findNewsList(String nclass) {
        List<News> newsList = null;
        try {
            newsList = dao.findList(nclass);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }
}
