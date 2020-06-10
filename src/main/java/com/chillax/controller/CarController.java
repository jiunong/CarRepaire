package com.chillax.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chillax.bean.Car;
import com.chillax.bean.User;
import com.chillax.service.CarService;
import com.chillax.utils.BaseController;
import com.chillax.utils.DateUtils;
import com.chillax.utils.StringUtil;
import com.chillax.utils.TableData;
@Controller
@RequestMapping("/car")
public class CarController extends BaseController {
	
	@Resource
	private CarService carService;
	/**页面跳转*/
	@RequestMapping("/list")
	public String workList(HttpServletRequest request,HttpSession session){
		String tag = request.getParameter("tag");
		request.setAttribute("tag", tag);
		return "car/car_list";
	}
	/**数据获取*/
	@RequestMapping("/getData")
	@ResponseBody
	public String getData(HttpServletResponse response,HttpServletRequest request,String carName){
		Integer offset = Integer.parseInt(request.getParameter("offset"));//开始条数
		Integer limit = Integer.parseInt(request.getParameter("limit"));//每页条数
		Map<String, Object> paramMap=new HashMap<String, Object>();
		String tag = request.getParameter("tag");
		User userOn=(User)request.getSession().getAttribute("userOn");
		if(!StringUtil.isEmpty(tag)){
			paramMap.put("tag", tag);//tag 标注是否查出在维修车辆 tag=1 不查出
		}
		paramMap.put("userId", userOn.getuId());
		paramMap.put("carName", carName);
		List<Car> cars = carService.selectAllByUser(paramMap);
		return TableData.getJson2Table(cars, offset, limit);
	}
	/**编辑零件信息 */
	@RequestMapping("/edit")
	public String editWork(HttpServletRequest request,Model model){
		try {
			String id = request.getParameter("id");
			Car car = new Car();
			if(StringUtil.isNotEmpty(id)){
				car = carService.selectByPrimaryKey(id);
			}
			model.addAttribute("car", car);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "car/car_edit";
	}
	@RequestMapping("/add")
	@ResponseBody
	public Integer addWorker(HttpServletRequest request,Car car){
		int record=0;
		User user=(User)request.getSession().getAttribute("userOn");
		if( StringUtil.isEmpty(car.getCarId())){
			/*设置关联用户id*/
			car.setUserId(user.getuId());
			car.setCarId(StringUtil.getStringId());
			record= carService.insertSelective(car);
		}else{
			record= carService.updateByPrimaryKeySelective(car);
		}
		return record;
	}
	/**删除机床*/
	@RequestMapping("/delById")
	@ResponseBody
	public Integer deleteWorker(HttpServletRequest request){
		String ids = request.getParameter("id");
		if(StringUtil.isNotEmpty(ids)){
			String[] sIds = ids.split(",");
			for (String sId : sIds) {
				carService.deleteByPrimaryKey(sId);
			}
			return 1;
		}else{
			return 0;
		}
	}
	
	@RequestMapping("/selectCar")
	@ResponseBody
	public Integer selectCar(HttpServletRequest request,HttpSession session,String carId){
		if(!StringUtil.isEmpty(carId)){
			Car preCar = carService.selectByPrimaryKey(carId);
			session.setAttribute("preCar", preCar);
		}
		return 1;
	}
	
	
	@RequestMapping("/getCarTypeData")
	@ResponseBody
	public List<Map<String,Object>> getCarTypeData(HttpServletRequest request,String month){
		if(StringUtil.isEmpty(month)){
			month=DateUtils.getYearMonths(1).get(0);
		}
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("date",month);
		List<Map<String,Object>> list = carService.selectCarTypeData(map);
		return list;
	}
}
