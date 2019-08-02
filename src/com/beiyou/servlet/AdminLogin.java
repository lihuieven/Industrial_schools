package com.beiyou.servlet;

import com.beiyou.service.AdminService;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin")
public class AdminLogin extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminService adminService = new AdminService();
        HttpSession session = null;
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        System.out.println(name);
        boolean b = adminService.findAdmin(name, password);
        if (b) {
            session = request.getSession();
            session.setAttribute("account",name);
            response.sendRedirect("/admin/index.jsp?id=1");
        } else {
            response.sendRedirect("/admin/login.jsp");
        }
    }
}
