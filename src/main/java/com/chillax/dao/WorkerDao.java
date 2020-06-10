package com.chillax.dao;

import java.util.List;
import java.util.Map;

import com.chillax.bean.Worker;

public interface WorkerDao {
    int deleteByPrimaryKey(String wId);

    int insert(Worker record);

    int insertSelective(Worker record);

    Worker selectByPrimaryKey(String wId);

    int updateByPrimaryKeySelective(Worker record);

    int updateByPrimaryKey(Worker record);
    
    List<Worker> selectWorkersByAttr(Worker worker);
    
    List<Map<String,Object>> selectWork(Map<String, Object> paramMap);
}