package com.chillax.utils;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

/**
 * @author Administrator
 */
public class BaseController {
	
	/**
	 * 将字符串以输出流的形式输出到浏览器的流中。
	 * 
	 * @param str
	 * @param response
	 */
	private void outString(String str, HttpServletResponse response) {
		try {
			response.setHeader("Content-type", "application/json;charset=UTF-8");
			response.getWriter().print(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void outJsonStr(String str,HttpServletResponse response){
		outString(str, response);
	}
	
	public void outObj2Json(Object obj,HttpServletResponse response){
		outString(JSON.toJSONString(obj), response);
	}
}
