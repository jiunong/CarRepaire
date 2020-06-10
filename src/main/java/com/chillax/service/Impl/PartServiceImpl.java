package com.chillax.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chillax.bean.Part;
import com.chillax.dao.PartMapper;
import com.chillax.service.PartService;
@Service("partService")
public class PartServiceImpl implements PartService{
	
	@Resource
	private  PartMapper  partMapper;

	@Override
	public int deleteByPrimaryKey(String partId) {
		// TODO Auto-generated method stub
		return partMapper.deleteByPrimaryKey(partId);
	}

	@Override
	public int insert(Part record) {
		// TODO Auto-generated method stub
		return partMapper.insert(record);
	}

	@Override
	public int insertSelective(Part record) {
		// TODO Auto-generated method stub
		return partMapper.insertSelective(record);
	}

	@Override
	public Part selectByPrimaryKey(String partId) {
		// TODO Auto-generated method stub
		return partMapper.selectByPrimaryKey(partId);
	}

	@Override
	public int updateByPrimaryKeySelective(Part record) {
		// TODO Auto-generated method stub
		return partMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Part record) {
		// TODO Auto-generated method stub
		return partMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Part> selectAll(Part record) {
		// TODO Auto-generated method stub
		return partMapper.selectAll( record);
	}


}
