package com.beiyou.dao;

import com.beiyou.entity.Subscribe;
import com.beiyou.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class SubscribeDao {
    private QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
    //查询预约成功用户
    public List<Subscribe> findYesList() throws Exception{
        String sql = "SELECT * FROM `lh_subscribe` where isshow = ?";
        return runner.query(sql,new BeanListHandler<Subscribe>(Subscribe.class),"y");
    }

    //查询所有预约用户
    public List<Subscribe> findAllList(int index, int currentCount) throws Exception{
        String sql = "SELECT * FROM `lh_subscribe` limit ?,?";
        return runner.query(sql,new BeanListHandler<Subscribe>(Subscribe.class),index,currentCount);
    }
    //写入预约用户
    public int regist(Subscribe subscribe) throws Exception{
        String sql = "INSERT INTO `lh_subscribe` (`id`, `name`, `school`, `phone`, `major`,`stime`) VALUES (?,?, ?,?,?,NOW())";
        return runner.update(sql,0,subscribe.getName(),subscribe.getSchool(),subscribe.getPhone(),subscribe.getMajor());
    }

    public void deleteId(int id) throws SQLException {
        String sql = "delete from lh_subscribe where id=?";
        runner.update(sql,id);
    }

    public void subscribeUpdateId(int id) throws SQLException {
        String sql = "update lh_subscribe set isshow = ? where id = ?";
        runner.update(sql,"y",id);
    }

    //查询预约总人数
    public int findAll() throws SQLException {
        String sql = "select count(*) from lh_subscribe";
        Long query = (Long)runner.query(sql,new ScalarHandler());
        return query.intValue();
    }
}
