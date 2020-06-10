package com.chillax.service;

import java.util.List;
import java.util.Map;

import com.chillax.bean.Car;

public interface CarService {
	int deleteByPrimaryKey(String carId);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(String carId);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);
    
    List<Car> selectAllByUser(Map<String, Object> paramMap);
    
    List<Map<String,Object>> selectCarTypeData(Map<String, Object> paramMap);
}
