package com.chillax.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 字符串操作类
 * 
 */
public class StringUtil {/**
	 * 判断字符串是否为空
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str) {
		if (str == null)
			return true;
		if (str.trim().equals(""))
			return true;
		return false;
	}

	/**
	 * 判断字符串非空
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str) {
		return !isEmpty(str);
	}

	/**
	 * 获取字符串id sylg+yyyyMMddHHmmss
	 */
	public static String getStringId() {
		SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmss"); 
		return "car"+format.format(new Date()); 
	}
	
	
}
