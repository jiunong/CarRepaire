package com.chillax.dao;

import java.util.List;
import java.util.Map;

import com.chillax.bean.User;

public interface UserDao {
    int deleteByPrimaryKey(Integer uId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> checkUserLogin(User record);
    
    List<User> selectAll(Map<String,Object> paramMap);
}