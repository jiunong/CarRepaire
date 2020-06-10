package com.chillax.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chillax.bean.Worker;
import com.chillax.dao.WorkerDao;
import com.chillax.service.WorkerService;
@Service("workerService")
public class WorkerServiceImpl implements WorkerService{
	
	@Resource
	private  WorkerDao workerDao;

	@Override
	public int deleteByPrimaryKey(String wId) {
		// TODO Auto-generated method stub
		return workerDao.deleteByPrimaryKey(wId);
	}

	@Override
	public int insert(Worker record) {
		// TODO Auto-generated method stub
		return workerDao.insert(record);
	}

	@Override
	public int insertSelective(Worker record) {
		// TODO Auto-generated method stub
		return workerDao.insertSelective(record);
	}

	@Override
	public Worker selectByPrimaryKey(String wId) {
		// TODO Auto-generated method stub
		return workerDao.selectByPrimaryKey(wId);
	}

	@Override
	public int updateByPrimaryKeySelective(Worker record) {
		// TODO Auto-generated method stub
		return workerDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Worker record) {
		// TODO Auto-generated method stub
		return workerDao.updateByPrimaryKey(record);
	}

	/**
	 * 通过部分属性查询 ，xml部分完成
	 */
	public List<Worker> selectWorkersByAttr(Worker worker) {
		// TODO Auto-generated method stub
		return workerDao.selectWorkersByAttr(worker);
	}

	@Override
	public List<Map<String, Object>> selectWork(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return workerDao.selectWork(paramMap);
	}

}
