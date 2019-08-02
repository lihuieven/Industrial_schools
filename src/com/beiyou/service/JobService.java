package com.beiyou.service;

import com.beiyou.dao.JobDao;
import com.beiyou.entity.Job;
import com.beiyou.entity.PageBean;

import java.sql.SQLException;
import java.util.List;

public class JobService {
    JobDao jobDao = new JobDao();

    //获取所有就业信息
    public List<Job> findJob() {
        List<Job> jobList = null;
        try {
            jobList = jobDao.findList();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobList;
    }

    //查询所有就业信息（带分页)
    public PageBean<Job> findJobList(int currentPage, int currentCount) {
        PageBean<Job> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setCurrentCount(currentCount);
        int totalCount = 0;
        try {
            totalCount = jobDao.findCount();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setTotalCount(totalCount);
        if (totalCount % currentCount == 0) {
            pageBean.setTotalPage(totalCount / currentCount);
        } else {
            pageBean.setTotalPage(totalCount / currentCount + 1);
        }
        int index = (currentPage - 1) * currentCount;
        List<Job> jobList = null;
        try {
            jobList = jobDao.findJobList(index, currentCount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        pageBean.setList(jobList);
        return pageBean;
    }

    //删除Job
    public void deleteJob(int id) {
        try {
            jobDao.deleteJob(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
