package com.chillax.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chillax.bean.User;
import com.chillax.dao.UserDao;
import com.chillax.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;

	@Override
	public int deleteByPrimaryKey(Integer uId) {
		// TODO Auto-generated method stub
		return userDao.deleteByPrimaryKey(uId);
	}

	@Override
	public int insert(User record) {
		// TODO Auto-generated method stub
		return userDao.insert(record);
	}

	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return userDao.insertSelective(record);
	}

	@Override
	public User selectByPrimaryKey(Integer uId) {
		// TODO Auto-generated method stub
		return userDao.selectByPrimaryKey(uId);
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return userDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(User record) {
		// TODO Auto-generated method stub
		return userDao.updateByPrimaryKey(record);
	}

	@Override
	public List<User> checkUserLogin(User record) {
		// TODO Auto-generated method stub
		return userDao.checkUserLogin(record);
	}

	@Override
	public List<User> selectAll(Map<String,Object> paramMap) {
		// TODO Auto-generated method stub
		return userDao.selectAll(paramMap);
	}
	
}
