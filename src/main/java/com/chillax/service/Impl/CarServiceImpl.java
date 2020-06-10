package com.chillax.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chillax.bean.Car;
import com.chillax.dao.CarMapper;
import com.chillax.service.CarService;

@Service("carService")
public class CarServiceImpl implements CarService {

	@Resource
	private CarMapper carMapper;

	@Override
	public int deleteByPrimaryKey(String carId) {
		// TODO Auto-generated method stub
		return carMapper.deleteByPrimaryKey(carId);
	}

	@Override
	public int insert(Car record) {
		// TODO Auto-generated method stub
		return carMapper.insert(record);
	}

	@Override
	public int insertSelective(Car record) {
		// TODO Auto-generated method stub
		return carMapper.insertSelective(record);
	}

	@Override
	public Car selectByPrimaryKey(String carId) {
		// TODO Auto-generated method stub
		return carMapper.selectByPrimaryKey(carId);
	}

	@Override
	public int updateByPrimaryKeySelective(Car record) {
		// TODO Auto-generated method stub
		return carMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Car record) {
		// TODO Auto-generated method stub
		return carMapper.updateByPrimaryKey(record);
	}


	@Override
	public List<Car> selectAllByUser(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return carMapper.selectAllByUser(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectCarTypeData(
			Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return carMapper.selectCarTypeData(paramMap);
	}


	
}
