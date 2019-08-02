package com.beiyou.servlet;

import com.beiyou.entity.Job;
import com.beiyou.service.JobService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/employment")
public class employment extends BeanServlet {
    //获取就业信息
    public void job(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JobService jobService = new JobService();
        List<Job> jobList = jobService.findJob();
        request.setAttribute("jobList",jobList);
        request.getRequestDispatcher("/employment.jsp").forward(request, response);
    }
}
