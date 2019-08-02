package com.beiyou.service;

import com.beiyou.dao.GuestbookDao;
import com.beiyou.entity.Guestbook;

import java.sql.SQLException;
import java.util.List;

public class GuestbookService {
    GuestbookDao guestbookDao = new GuestbookDao();

    //查询所有留言
    public List<Guestbook> findAll() {
        List<Guestbook> guestbooks = null;
        try {
            guestbooks = guestbookDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return guestbooks;
    }

    public void deleteId(int id) {
        try {
            guestbookDao.deleteId(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void isokGuestbook(int id) {
        try {
            guestbookDao.isokGuestbook(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
