package com.chillax.service;

import java.util.List;

import com.chillax.bean.Part;

public interface PartService {
	 int deleteByPrimaryKey(String partId);

	    int insert(Part record);

	    int insertSelective(Part record);

	    Part selectByPrimaryKey(String partId);

	    int updateByPrimaryKeySelective(Part record);

	    int updateByPrimaryKey(Part record);
	    /*获取所有零件*/
	    List<Part> selectAll(Part record);
}
