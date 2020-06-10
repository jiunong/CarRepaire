package com.chillax.dao;

import java.util.List;
import java.util.Map;

import com.chillax.bean.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(String orderId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(String orderId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Map<String,Object>> selectOrderByAttr(Map<String, Object> paramMap);
}