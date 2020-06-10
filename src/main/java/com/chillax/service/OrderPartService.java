package com.chillax.service;

import java.util.List;
import java.util.Map;

import com.chillax.bean.OrderPart;

public interface OrderPartService {
	 int insert(OrderPart record);

	 int insertSelective(OrderPart record);
	 
	 List<Map<String, Object>> selectByOrderId(String orderId);
}
