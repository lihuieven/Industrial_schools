package com.beiyou.dao;

import com.beiyou.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;

public class AdminDao {
    QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
    String sql = null;

    //登录检查
    public int findAdmin(String name, String password) throws SQLException {
        sql = "select count(*) from lh_admin where account = ? and passwd = ?";
        Long row = (Long) runner.query(sql,new ScalarHandler(),name,password);
        return row.intValue();
    }

    public void updateAdmin(String name, String newPassword) throws SQLException {
        sql = "update lh_admin set passwd = ? where account = ?";
        runner.update(sql,newPassword,name);
    }
}
