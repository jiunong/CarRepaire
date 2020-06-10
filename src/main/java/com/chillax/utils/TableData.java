package com.chillax.utils;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;

/**
 * 获取表格分页数据
 *
 */
public class TableData {
    /**
     *
     * @param rows 显示的数据集合
     * @param offset 页面开始条数
     * @param limit 页面总条数
     * @return
     */
    public static String  getJson2Table(List rows,Integer offset,Integer limit) {
        Integer total=rows.size();
        JSONObject result = new JSONObject();
        PageHelper.startPage(offset,limit);
        /*目标数据 newRows*/
        List newRows=new ArrayList();
        if((offset+limit)>total){
            newRows = rows.subList(offset,total);
        }else {
            newRows = rows.subList(offset,offset+limit);
        }
        result.put("rows",newRows);
        result.put("total",total);
        return result.toJSONString();
    }

}
