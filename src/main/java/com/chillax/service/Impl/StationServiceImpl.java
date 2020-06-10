package com.chillax.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chillax.bean.SStation;
import com.chillax.dao.SStationDao;
import com.chillax.service.StationService;
@Service("stationService")
public class StationServiceImpl implements StationService{
	
	@Resource
	private  SStationDao  stationDao;

	@Override
	public int deleteByPrimaryKey(Integer sId) {
		// TODO Auto-generated method stub
		return stationDao.deleteByPrimaryKey(sId);
	}

	@Override
	public int insert(SStation record) {
		// TODO Auto-generated method stub
		return stationDao.insert(record);
	}

	@Override
	public int insertSelective(SStation record) {
		// TODO Auto-generated method stub
		return stationDao.insertSelective(record);
	}

	@Override
	public SStation selectByPrimaryKey(Integer sId) {
		// TODO Auto-generated method stub
		return stationDao.selectByPrimaryKey(sId);
	}

	@Override
	public int updateByPrimaryKeySelective(SStation record) {
		// TODO Auto-generated method stub
		return stationDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(SStation record) {
		// TODO Auto-generated method stub
		return stationDao.updateByPrimaryKey(record);
	}

	@Override
	public List<SStation> selectAll(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return stationDao.selectAll(paramMap);
	}



}
