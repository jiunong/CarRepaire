package com.chillax.dao;

import java.util.List;
import java.util.Map;

import com.chillax.bean.OrderWorker;

public interface OrderWorkerMapper {
    int insert(OrderWorker record);

    int insertSelective(OrderWorker record);
    
    List<Map<String, Object>> selectByOrderId(String orderId);
}