package com.beiyou.dao;

import com.beiyou.entity.Ad;
import com.beiyou.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import javax.xml.crypto.Data;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class AdDao {
    //查询已开放轮播图
    public List<Ad> fingAdList() throws Exception {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT * FROM `lh_ad` where isshow = ?";
        return runner.query(sql, new BeanListHandler<Ad>(Ad.class), "y");
    }

    //查询所有轮播图
    public List<Ad> fingAdAllList(int index, int currentCount) throws Exception {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT * FROM `lh_ad` limit ?,?";
        return runner.query(sql, new BeanListHandler<Ad>(Ad.class),index,currentCount);
    }

    //写入新的轮播图
    public int insertAdAdd(String title, String url, String img) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into lh_ad values(0,?,?,?,?,0)";
        return runner.update(sql, title, url, img, "n");
    }

    //删除轮播图
    public void deleteAd(String id) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from lh_ad where id=?";
        runner.update(sql, id);
    }

    //根据ID查询轮播图
    public Ad findAdId(String id) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from lh_ad where id = ?";
        return runner.query(sql, new BeanHandler<Ad>(Ad.class), id);
    }

    //修改轮播图
    public void editorAd(String id, String title, String url) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update lh_ad set title=?,url=? where id=?";
        runner.update(sql, title, url, id);
    }

    //获取封装总条数
    public int fingAdAllCount() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT count(*) FROM `lh_ad`";
        Long query = (Long) runner.query(sql, new ScalarHandler());
        return query.intValue();
    }
}
