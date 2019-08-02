package com.beiyou.dao;

import com.beiyou.entity.Config;
import com.beiyou.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ConfigDao {
    //查询
    public List<Config> configAll() throws Exception {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT * FROM `lh_config`";
        return runner.query(sql,new BeanListHandler<Config>(Config.class));
    }

    //修改
    public int  configUpdate(Config config) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "UPDATE `lh_config` SET `vv`= ? WHERE kk = ?";
        return runner.update(sql,config.getVv(),config.getKk());
    }

}
