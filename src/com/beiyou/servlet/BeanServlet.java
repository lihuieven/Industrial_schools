package com.beiyou.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;


public class BeanServlet extends HttpServlet {
    private static List<String> urls = new ArrayList<>();

    static {
        urls.add("/admin/login.jsp");
        urls.add("indexpage");
        urls.add("/school.jsp");
        urls.add("/online.jsp");
        urls.add("/ui.jsp");
        urls.add("/phone.jsp");
        urls.add("/kefuzy.jsp");
        urls.add("/media.jsp");
        urls.add("/big_data.jsp");
        urls.add("/news.jsp");
        urls.add("/contact-us.jsp");
        urls.add("adFile");
        urls.add("job");


    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String urlPattern = req.getServletPath();
        String path = req.getRequestURI();
        String methods = req.getParameter("method");
        for (String url : urls) {
            if (url.equals(methods) ||url.equals(urlPattern) || path.contains(url)) {
                try {
                    String methodName = req.getParameter("method");
                    Class clazz = this.getClass();
                    Method method = clazz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
                    method.invoke(this, req, resp);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return;
            }
        }

        if (req.getSession().getAttribute("account") == null) {
            System.out.println(req.getSession().getAttribute("person"));
            resp.sendRedirect("/admin/login.jsp");
        } else {
            System.out.println(req.getSession().getAttribute("account"));
            try {
                String methodName = req.getParameter("method");
                Class clazz = this.getClass();
                Method method = clazz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
                method.invoke(this, req, resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
