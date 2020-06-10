package com.chillax.service;

import java.util.List;
import java.util.Map;

import com.chillax.bean.SStation;

public interface StationService {
	 int deleteByPrimaryKey(Integer sId);

	    int insert(SStation record);

	    int insertSelective(SStation record);

	    SStation selectByPrimaryKey(Integer sId);

	    int updateByPrimaryKeySelective(SStation record);

	    int updateByPrimaryKey(SStation record);
	    
	    List<SStation>  selectAll(Map<String,Object> paramMap);
}
