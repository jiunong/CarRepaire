package com.chillax.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chillax.bean.Order;
import com.chillax.dao.OrderMapper;
import com.chillax.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Resource
	private OrderMapper orderMapper;

	@Override
	public int deleteByPrimaryKey(String orderId) {
		// TODO Auto-generated method stub
		return orderMapper.deleteByPrimaryKey(orderId);
	}

	@Override
	public int insert(Order record) {
		// TODO Auto-generated method stub
		return orderMapper.insert(record);
	}

	@Override
	public int insertSelective(Order record) {
		// TODO Auto-generated method stub
		return orderMapper.insertSelective(record);
	}

	@Override
	public Order selectByPrimaryKey(String orderId) {
		// TODO Auto-generated method stub
		return orderMapper.selectByPrimaryKey(orderId);
	}

	@Override
	public int updateByPrimaryKeySelective(Order record) {
		// TODO Auto-generated method stub
		return orderMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Order record) {
		// TODO Auto-generated method stub
		return orderMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Map<String, Object>> selectOrderByAttr(
			Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return orderMapper.selectOrderByAttr(paramMap);
	}


	
}
