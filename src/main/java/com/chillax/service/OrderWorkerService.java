package com.chillax.service;

import java.util.List;
import java.util.Map;

import com.chillax.bean.OrderWorker;

public interface OrderWorkerService {
	   int insert(OrderWorker record);

	    int insertSelective(OrderWorker record);
	    
	    List<Map<String, Object>> selectByOrderId(String orderId);
}
