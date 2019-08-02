package com.beiyou.dao;

import com.beiyou.entity.Guestbook;
import com.beiyou.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class GuestbookDao {
    QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
    String sql = null;

    //查询所有留言
    public List<Guestbook> findAll() throws SQLException {
        sql = "select * from lh_guestbook";
        return runner.query(sql, new BeanListHandler<>(Guestbook.class));
    }

    public void deleteId(int id) throws SQLException {
        sql = "delete from lh_guestbook where id = ?";
        runner.update(sql,id);
    }

    public void isokGuestbook(int id) throws SQLException {
        sql = "UPDATE `lh_guestbook` SET `isok` = ? WHERE `id`= ?";
        runner.update(sql,"y",id);
    }
}
