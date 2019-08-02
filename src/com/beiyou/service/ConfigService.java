package com.beiyou.service;

import com.beiyou.dao.ConfigDao;
import com.beiyou.entity.Config;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ConfigService {
    ConfigDao configDao = new ConfigDao();

    //查询
    public Map<String,String> configAll(){
        List<Config> list = null;
        try{
            list = configDao.configAll();
        }catch (Exception e) {
            e.printStackTrace();
        }
        Map<String,String> map = new HashMap<>();
        for(Config config : list){
            String kk = config.getKk();
            String vv = config.getVv();
            map.put(kk,vv);
        }
        return map;
    }

    //修改
    public boolean configUpdate(Config config) {
        int a = 0;
        try {
            a = configDao.configUpdate(config);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a > 0 ? true : false;
    }
}
