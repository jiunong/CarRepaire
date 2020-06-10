package com.chillax.service;

import java.util.List;
import java.util.Map;

import com.chillax.bean.User;

public interface UserService {
	
	int deleteByPrimaryKey(Integer uId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    /**传入用户  根据名字和密码匹配所有数据 */
    List<User> checkUserLogin(User record);
    
    List<User> selectAll(Map<String,Object> paramMap);
}
