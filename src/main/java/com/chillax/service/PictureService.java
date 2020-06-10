package com.chillax.service;

import com.chillax.bean.Picture;

public interface PictureService {
	  int deleteByPrimaryKey(String pictureId);

	    int insert(Picture record);

	    int insertSelective(Picture record);

	    Picture selectByPrimaryKey(String pictureId);

	    int updateByPrimaryKeySelective(Picture record);

	    int updateByPrimaryKey(Picture record);
}
