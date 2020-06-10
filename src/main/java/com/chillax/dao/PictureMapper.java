package com.chillax.dao;

import com.chillax.bean.Picture;

public interface PictureMapper {
    int deleteByPrimaryKey(String pictureId);

    int insert(Picture record);

    int insertSelective(Picture record);

    Picture selectByPrimaryKey(String pictureId);

    int updateByPrimaryKeySelective(Picture record);

    int updateByPrimaryKey(Picture record);
}