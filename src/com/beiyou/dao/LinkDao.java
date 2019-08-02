package com.beiyou.dao;

import com.beiyou.entity.Link;
import com.beiyou.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class LinkDao {
    QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
    String sql = null;

    //查询所有链接(后台)
    public List<Link> findAllLink() throws SQLException {
        List<Link> linkList = null;
        sql = "select * from lh_link";
        linkList = runner.query(sql, new BeanListHandler<>(Link.class));
        return linkList;
    }

    //删除链接（后台）
    public void deleteLink(int id) throws SQLException {
        sql = "delete from lh_link where id = ?";
        runner.update(sql, id);
    }

    //插入链接(后台)
    public void inserLink(Link link) throws SQLException {
        sql = "insert into lh_link VALUES (?,?,?,?)";
        runner.update(sql, 0, link.getTitle(), link.getUrl(), 0);
    }

}
