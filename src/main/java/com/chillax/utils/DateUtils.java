package com.chillax.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateUtils {

	
		public static List<String> getYearMonths( Integer count) {
			SimpleDateFormat format=new SimpleDateFormat("yyyy年-MM月");
			Calendar c = Calendar.getInstance();
			c.setTime(new Date());
			List<String> yearMonths=new ArrayList<String>();
			Date date = c.getTime();
			String nowMonth = format.format(date);
			yearMonths.add(nowMonth);
			for (int i = 0; i < count-1; i++) {
				c.add(Calendar.MONTH, -1);
				Date m = c.getTime();
				String mon = format.format(m);
				yearMonths.add(mon);
			}
//			Collections.reverse(yearMonths);
			return yearMonths;
		}
	
}
