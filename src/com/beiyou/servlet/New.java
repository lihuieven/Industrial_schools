package com.beiyou.servlet;

import com.beiyou.entity.News;
import com.beiyou.service.NewsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/news")
public class New extends BeanServlet {
    NewsService newsService = new NewsService();

    //查询所有新闻
    public void newsList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nclass = request.getParameter("ncalss");
        List<News> newsList = newsService.findNewsList(nclass);
        request.setAttribute("newsList",newsList);
        request.getRequestDispatcher("/news.jsp").forward(request,response);
    }

}
