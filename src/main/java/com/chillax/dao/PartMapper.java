package com.chillax.dao;

import java.util.List;

import com.chillax.bean.Part;

public interface PartMapper {
    int deleteByPrimaryKey(String partId);

    int insert(Part record);

    int insertSelective(Part record);

    Part selectByPrimaryKey(String partId);

    int updateByPrimaryKeySelective(Part record);

    int updateByPrimaryKey(Part record);
    
    List<Part> selectAll(Part record);
}