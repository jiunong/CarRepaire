package com.chillax.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chillax.bean.Picture;
import com.chillax.dao.PictureMapper;
import com.chillax.service.PictureService;

@Service("pictureService")
public class PictureServiceImpl implements PictureService {

	@Resource
	private PictureMapper pictureMapper;

	@Override
	public int deleteByPrimaryKey(String pictureId) {
		// TODO Auto-generated method stub
		return pictureMapper.deleteByPrimaryKey(pictureId);
	}

	@Override
	public int insert(Picture record) {
		// TODO Auto-generated method stub
		return pictureMapper.insert(record);
	}

	@Override
	public int insertSelective(Picture record) {
		// TODO Auto-generated method stub
		return pictureMapper.insertSelective(record);
	}

	@Override
	public Picture selectByPrimaryKey(String pictureId) {
		// TODO Auto-generated method stub
		return pictureMapper.selectByPrimaryKey(pictureId);
	}

	@Override
	public int updateByPrimaryKeySelective(Picture record) {
		// TODO Auto-generated method stub
		return pictureMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Picture record) {
		// TODO Auto-generated method stub
		return pictureMapper.updateByPrimaryKey(record);
	}


	
}
