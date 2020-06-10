package com.chillax.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chillax.bean.OrderWorker;
import com.chillax.dao.OrderWorkerMapper;
import com.chillax.service.OrderWorkerService;

@Service("orderWorkerService")
public class OrderWorkerServiceImpl implements OrderWorkerService {

	@Resource
	private OrderWorkerMapper orderWorkerMapper;

	@Override
	public int insert(OrderWorker record) {
		// TODO Auto-generated method stub
		return orderWorkerMapper.insert(record);
	}

	@Override
	public int insertSelective(OrderWorker record) {
		// TODO Auto-generated method stub
		return orderWorkerMapper.insertSelective(record);
	}

	@Override
	public List<Map<String, Object>> selectByOrderId(String orderId) {
		// TODO Auto-generated method stub
		return orderWorkerMapper.selectByOrderId(orderId);
	}


	
}
