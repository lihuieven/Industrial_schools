package com.beiyou.dao;

import com.beiyou.entity.Job;
import com.beiyou.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.taglibs.standard.tag.common.sql.DataSourceUtil;

import java.sql.SQLException;
import java.util.List;

public class JobDao {
    QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

    //获取就业信息(不带分页)
    public List<Job> findJobList(int index, int currentCount) throws Exception {
        String sql = "SELECT * FROM `lh_job` limit ?,?";
        return runner.query(sql, new BeanListHandler<Job>(Job.class), index, currentCount);
    }

    public void deleteJob(int id) throws SQLException {
        String sql = "delete from lh_job where id = ?";
        runner.update(sql, id);
    }

    //查询就业总条数
    public int findCount() throws SQLException {
        String sql = "select count(*) from lh_job";
        Long query = (Long) runner.query(sql, new ScalarHandler());
        return query.intValue();
    }

    //获取就业信息
    public List<Job> findList() throws SQLException {
        String sql = "SELECT * FROM `lh_job`";
        return runner.query(sql, new BeanListHandler<Job>(Job.class));
    }
}
