package com.beiyou.service;

import com.beiyou.dao.LinkDao;
import com.beiyou.entity.Link;

import java.sql.SQLException;
import java.util.List;

public class LinkService {
    LinkDao linkDao = new LinkDao();

    //查询友情链接所有
    public List<Link> findLink() {
        List<Link> linkList = null;
        try {
            linkList = linkDao.findAllLink();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return linkList;
    }

    //删除友情链接（id）
    public void deleteLinkId(int id) {
        try {
            linkDao.deleteLink(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //插入友情链接
    public void insertLink(Link link) {
        try {
            linkDao.inserLink(link);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
