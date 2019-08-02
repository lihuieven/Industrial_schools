package com.beiyou.servlet;

import com.beiyou.entity.Ad;
import com.beiyou.entity.Job;
import com.beiyou.entity.News;
import com.beiyou.entity.Subscribe;
import com.beiyou.service.AdService;
import com.beiyou.service.JobService;
import com.beiyou.service.NewsService;
import com.beiyou.service.SubscribeService;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/page")
public class Index extends BeanServlet {
    public void indexpage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        NewsService newsService = new NewsService();
        JobService jobService = new JobService();
        SubscribeService subscribeService = new SubscribeService();
        AdService adService = new AdService();

        //获取学校新闻
        List<News> schoolNewsList = newsService.findSchoolNewList();
        //获取行业资讯
        List<News> industryNewsList = newsService.findindustryNewsList();
        //获取就业同学信息
        List<Job> jobList = jobService.findJob();

        //将数据放到request作用域中
        request.setAttribute("schoolNewsList", schoolNewsList);

        request.setAttribute("industryNewsList", industryNewsList);

        request.setAttribute("jobList",jobList);

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    public void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Map<String, String[]> subscribes = request.getParameterMap();
        Subscribe subscribe = new Subscribe();

        //映射封装
        try{
            BeanUtils.populate(subscribe, subscribes);
        }catch (Exception e){
            e.printStackTrace();
        }
        //id
        subscribe.setId(0);
        SubscribeService subscribeService = new SubscribeService();
        boolean isSuccess = subscribeService.regist(subscribe);

        response.sendRedirect(request.getContextPath() + "/page?method=indexpage");
    }

}
