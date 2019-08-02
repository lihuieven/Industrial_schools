package com.beiyou.dao;

import com.beiyou.entity.News;
import com.beiyou.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.taglibs.standard.tag.common.sql.DataSourceUtil;

import java.sql.SQLException;
import java.util.List;

public class NewsDao {
    QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

    //获取学校新闻
    public List<News> findSchoolNewsList() throws Exception {

        String sql = "select * from lh_news where nclass = ? order by anow desc limit ?,?";
        return runner.query(sql, new BeanListHandler<News>(News.class), "学校动态", 0, 8);
    }

    //获取行业新闻
    public List<News> findindustryNewsList() throws Exception {
        String sql = "select * from lh_news where nclass = ? order by anow desc limit ?,?";
        return runner.query(sql, new BeanListHandler<News>(News.class), "行业新闻", 0, 8);
    }

    //获取所有新闻，按照时间排序
    public List<News> findNews() throws SQLException {
        String sql = "select * from lh_news order by anow desc";
        return runner.query(sql, new BeanListHandler<News>(News.class));
    }

    //删除新闻
    public void deleteNews(int id) throws SQLException {
        String sql = "delete from lh_news where id = ?";
        runner.update(sql, id);
    }

    //获取新闻总条数
    public int findNewsCount() throws SQLException {
        String sql = "select count(*) from lh_news";
        Long query = (Long) runner.query(sql,new ScalarHandler());
        return query.intValue();
    }

    //获取当前页数据，带分页
    public List<News> findNewsList(int index, int currentCount) throws SQLException {
        String sql = "select * from lh_news order by anow desc limit ?,?";
        return runner.query(sql, new BeanListHandler<News>(News.class),index,currentCount);
    }

    //分类查询所有新闻
    public List<News> findList(String nclass) throws SQLException {
        String sql = "select * from lh_news where nclass = ? order by atime desc limit 0,5";
        return runner.query(sql, new BeanListHandler<News>(News.class),nclass);
    }
}
