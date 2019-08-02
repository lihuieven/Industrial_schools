package com.beiyou.service;

import com.beiyou.dao.AdminDao;
import com.beiyou.entity.Admin;

import java.sql.SQLException;

public class AdminService {
    AdminDao adminDao = new AdminDao();

    public boolean findAdmin(String name, String password) {
        int row = 0;
        try {
            row = adminDao.findAdmin(name,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row>0?true:false;
    }

    public void updateAdmin(String name, String password, String newPassword) {
        int row = 0;
        try {
            row = adminDao.findAdmin(name,password);
            if(row>0){
                adminDao.updateAdmin(name,newPassword);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
