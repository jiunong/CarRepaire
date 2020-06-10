package com.chillax.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chillax.bean.OrderPart;
import com.chillax.dao.OrderPartMapper;
import com.chillax.service.OrderPartService;

@Service("orderPartService")
public class OrderPartServiceImpl implements OrderPartService {

	@Resource
	private OrderPartMapper orderPartMapper;

	@Override
	public int insert(OrderPart record) {
		// TODO Auto-generated method stub
		return orderPartMapper.insert(record);
	}

	@Override
	public int insertSelective(OrderPart record) {
		// TODO Auto-generated method stub
		return orderPartMapper.insertSelective(record);
	}

	@Override
	public List<Map<String, Object>> selectByOrderId(String orderId) {
		// TODO Auto-generated method stub
		return orderPartMapper.selectByOrderId(orderId);
	} 


	
}
