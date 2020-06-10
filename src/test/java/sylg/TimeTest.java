package sylg;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.format.annotation.DateTimeFormat;

public class TimeTest {

	@Test
	public void  getWorkId() {
		SimpleDateFormat format=new SimpleDateFormat("yyyy年-MM月");
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		List<String> yearMonths=new ArrayList<String>();
		for (int i = 1; i <= 12; i++) {
			c.add(Calendar.MONTH, -1);
			Date m = c.getTime();
			String mon = format.format(m);
			yearMonths.add(mon);
		}
		Collections.reverse(yearMonths);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日-HH时mm分ss秒");
		String time = formatter.format(new Date());
		System.out.println(time);
	}
	
	@Test
	public void  getTimeParam() {
		 Map<String,Object> map=new HashMap<String, Object>();
		 	SimpleDateFormat format=new SimpleDateFormat("yyyy年-MM月");
		 	SimpleDateFormat format2=new SimpleDateFormat("yyyy年-MM月-dd日");
			Calendar c = Calendar.getInstance();
			c.setTime(new Date());
			c.add(Calendar.DAY_OF_MONTH, -1);
			Date m1 = c.getTime();
			String today = format2.format(m1);
	        c.add(Calendar.MONTH, -1);
	        Date m = c.getTime();
	        String mon = format.format(m);
	        c.add(Calendar.MONTH, -2);
	        int season = 0;  
	        int month = c.get(Calendar.MONTH);  
	        int year = c.get(Calendar.YEAR);  
	        switch (month) {  
	        case Calendar.JANUARY:  
	        case Calendar.FEBRUARY:  
	        case Calendar.MARCH:  
	            season = 1;  
	            break;  
	        case Calendar.APRIL:  
	        case Calendar.MAY:  
	        case Calendar.JUNE:  
	            season = 2;  
	            break;  
	        case Calendar.JULY:  
	        case Calendar.AUGUST:  
	        case Calendar.SEPTEMBER:  
	            season = 3;  
	            break;  
	        case Calendar.OCTOBER:  
	        case Calendar.NOVEMBER:  
	        case Calendar.DECEMBER:  
	            season = 4;  
	            break;  
	        default:  
	            break;  
	        }  
	        //六个月前
	        c.add(Calendar.MONTH, -3);
	        Date m2 = c.getTime();
	        String mon2 = format.format(m2);
	        Calendar nowYear = Calendar.getInstance();  
	        nowYear.setTime(new Date()); 
	        map.put("today", today);
	        map.put("month",mon);
	        map.put("quarter", year+"年-"+season+"季度");
	        map.put("monthBegin",mon2);
			map.put("nowYear", nowYear.get(Calendar.YEAR)) ;
	}
	
}
