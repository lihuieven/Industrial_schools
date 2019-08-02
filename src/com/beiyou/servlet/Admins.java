package com.beiyou.servlet;

import com.beiyou.entity.*;
import com.beiyou.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/a")
public class Admins extends BeanServlet {
    SubscribeService subscribeService = new SubscribeService();
    NewsService newsService = new NewsService();
    LinkService linkService = new LinkService();
    JobService jobService = new JobService();
    AdminService adminService = new AdminService();
    GuestbookService guestbookService = new GuestbookService();

    //清除登录信息
    public void exit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("account");
        response.sendRedirect("/admin");
    }

    //查询所有预约用户
    public void subscribeAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentPages = request.getParameter("currentPage");
        if (currentPages == null) {
            currentPages = "1";
        }
        int currentPage = Integer.parseInt(currentPages);
        int currentCount = 15;
        PageBean pageBean = (PageBean) subscribeService.findAllList(currentPage, currentCount);
        request.setAttribute("pageBean", pageBean);
        request.getRequestDispatcher("/admin/subscribe.jsp").forward(request, response);
    }

    //删除预约用户（id）
    public void subscribeId(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        subscribeService.deleteId(id);
        response.sendRedirect("/admin/a?method=subscribeAll&id=3");
    }

    //修改预约用户状态
    public void subscribeUpdateId(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        subscribeService.subscribeUpdateId(id);
        response.sendRedirect("/admin/a?method=subscribeAll&id=3");
    }

    //新闻动态管理
    //查找所有新闻(带分页)
    public void findNews(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //获取分页的页码
        String currentPageNews = request.getParameter("currentPage");
        //如果为空，则给与初始值1
        if (currentPageNews == null) {
            currentPageNews = "1";
        }
        int currentPage = Integer.parseInt(currentPageNews);
        //每一页显示条数
        int currentCount = 4;
        PageBean pageBean = newsService.findNewsListCount(currentPage, currentCount);
        request.setAttribute("pageBean", pageBean);
        request.getRequestDispatcher("/admin/news.jsp").forward(request, response);
    }

    //删除新闻（ID）
    public void deleteNews(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        newsService.deleteNews(id);
        response.sendRedirect("/admin/a?method=findNews&id=4");
    }

    //查询友情链接
    public void findLink(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Link> linkList = linkService.findLink();
        request.setAttribute("linkList", linkList);
        request.getRequestDispatcher("/admin/link.jsp").forward(request, response);
    }

    //删除友情链接（ID）
    public void deleteLinkId(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        linkService.deleteLinkId(id);
        response.sendRedirect("/admin/a?method=findLink&id=5");
    }

    //插入友情链接
    public void inserLink(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String url = request.getParameter("url");
        Link link = new Link();
        link.setTitle(title);
        link.setUrl(url);
        linkService.insertLink(link);
        response.sendRedirect("/admin/a?method=findLink&id=5");
    }

    //查询就业信息
    public void findJob(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentPages = request.getParameter("currentPage");
        if (currentPages == null) {
            currentPages = "1";
        }
        int currentPage = Integer.parseInt(currentPages);
        int currentCount = 5;

        PageBean<Job> pageBean = jobService.findJobList(currentPage, currentCount);
        request.setAttribute("pageBean", pageBean);
        request.getRequestDispatcher("/admin/job.jsp").forward(request, response);
    }

    //删除就业信息（ID）
    public void deleteJob(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        jobService.deleteJob(id);
        response.sendRedirect("/admin/a?method=findJob&id=7");
    }

    //留言管理模块
    //查询所有留言
    public void guestbookAll(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        List<Guestbook> guestbookList = guestbookService.findAll();
        request.setAttribute("guestbookList", guestbookList);
        request.getRequestDispatcher("/admin/guestbook.jsp").forward(request, response);
    }

    //删除留言（ID）
    public void deleteId(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        guestbookService.deleteId(id);
        response.sendRedirect("/admin/a?method=guestbookAll&id=8");
    }

    //处理留言状态
    public void isokGuestbook(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        guestbookService.isokGuestbook(id);
        response.sendRedirect("/admin/a?method=guestbookAll&id=8");
    }

    //用户信息管理模块
    //修改用户信息
    public void updateAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("account");
        String password = request.getParameter("passwd");
        String newPassword = request.getParameter("pwd1");

        adminService.updateAdmin(name, password, newPassword);
        response.sendRedirect("/admin");
    }
}
