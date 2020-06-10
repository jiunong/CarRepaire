package com.chillax.dao;

import java.util.List;
import java.util.Map;

import com.chillax.bean.OrderPart;

public interface OrderPartMapper {
    int insert(OrderPart record);

    int insertSelective(OrderPart record);
    
    List<Map<String, Object>> selectByOrderId(String orderId);
}