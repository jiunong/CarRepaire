package com.chillax.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.chillax.bean.Car;
import com.chillax.bean.Order;
import com.chillax.bean.OrderPart;
import com.chillax.bean.OrderWorker;
import com.chillax.bean.Part;
import com.chillax.bean.SStation;
import com.chillax.bean.User;
import com.chillax.bean.Worker;
import com.chillax.service.CarService;
import com.chillax.service.OrderPartService;
import com.chillax.service.OrderService;
import com.chillax.service.OrderWorkerService;
import com.chillax.service.PartService;
import com.chillax.service.StationService;
import com.chillax.service.WorkerService;
import com.chillax.utils.BaseController;
import com.chillax.utils.DateUtils;
import com.chillax.utils.StringUtil;

/**
* @Description 订单控制器
* @Param
* @return
* @Author XuHong,Ding
* @Date 9:19 2020/6/16
**/
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {

	private final Integer MONTHS=20;
	
	@Resource
	private CarService carService;

	@Resource
	private StationService stationService;

	@Resource
	private PartService partService;
	@Resource
	private OrderPartService orderPartService;
	
	@Resource
	private OrderWorkerService orderWorkerService;

	@Resource
	private WorkerService workerService;

	@Resource
	private OrderService orderService;

	/** 页面跳转 预定页面 */
	@RequestMapping("/toPreOrder")
	public String toPreOrder(HttpServletRequest request, HttpSession session,
			String carId) {
		return "order/preOrder";
	}

	/** 订单预定 */
	@RequestMapping("/preOrder")
	@ResponseBody
	public Integer preOrder(HttpServletRequest request, HttpSession session,
			String imgurls, String arriveTime, String desc) {
		// User user=(User)session.getAttribute("userOn");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date arrDate = null;
		try {
			arrDate = format.parse(arriveTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Car car = (Car) session.getAttribute("preCar");
		car.setCarState(1);
		int updateCar = carService.updateByPrimaryKeySelective(car);
		Order order = new Order();
		order.setOrderId(StringUtil.getStringId());
		order.setCarId(car.getCarId());
		order.setoDescribe(desc);
		// 0 预约中 1预约成功 2正在执行 3完成 4拒绝
		order.setoState("0");
		order.setArriveTime(arrDate);
		order.setOrdertime(new Date());
		order.setImgUrls(imgurls);
		int updateOrder = orderService.insertSelective(order);
		return updateOrder+updateCar;
	}

	/** 订单操作 */
	@RequestMapping("/manage")
	public String manageOrder(HttpServletRequest request, HttpSession session,String orderId) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("orderId", orderId);
		//通过id查出只能是一条数据
 		List<Map<String, Object>> order = orderService.selectOrderByAttr(paramMap);
 		String[] imgurls = order.get(0).get("imgUrls").toString().split(",");
 		//查询所有待使用的机床
 		List<SStation> stations=stationService.selectAll(new HashMap<String, Object>(){/**
			 * 
			 */
			private static final long serialVersionUID = 1L;

		{put("s_state", "完好待使用");}});
 		//查询所有空闲的工人 state=1空闲 2在忙 0离职
 		List<Worker> workers = workerService.selectWorkersByAttr(new Worker(){{setwState(1);}});
 		//查询所有可使用零件
 		List<Part> parts = partService.selectAll(new Part());
 		request.setAttribute("imgurls",imgurls);
 		request.setAttribute("dealOrder",order.get(0));
 		request.setAttribute("stations",stations);
 		request.setAttribute("workers",workers);
 		request.setAttribute("parts",parts);
 		return "order/manageOrder";
	}
	
	/** 页面跳转 */
	@RequestMapping("/list")
	public String workList(HttpServletRequest request, HttpSession session,String state) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("state", state);
 		List<Map<String, Object>> order = orderService.selectOrderByAttr(paramMap);
 		session.setAttribute("order", order);
 		request.setAttribute("state", state);
		return "order/order_list";
	}

	/**  */
	@RequestMapping("/accept")
	@ResponseBody
	public String acceptOrder(HttpServletResponse response,HttpServletRequest request,String orderId,
			String remark,String stationId) {
		String success="1";
		//获取订单id 机床id 员工id集合 零件id num集合
		String selectedWorker=request.getParameter("selectedWorker");
		String[] workers = selectedWorker.split(",");
		String selParts=request.getParameter("parts");
		JSONArray parts=JSONArray.parseArray(selParts);
		//修改订单状态 修改机床状态 更新order-worker order-part表
		try {
				
				Order order = orderService.selectByPrimaryKey(orderId);
				order.setStationId(Integer.parseInt(stationId));
				order.setoState("1");//1进行中
				order.setRemark(remark);
				order.setBegintime(new Date());
				orderService.updateByPrimaryKeySelective(order);//更新order
				
				SStation station = stationService.selectByPrimaryKey(Integer.parseInt(stationId));
				station.setsState("完好在使用");
				stationService.updateByPrimaryKeySelective(station);
				for(int i=0;i<parts.size();i++){
					JSONObject jo = parts.getJSONObject(i);
					String pId = jo.get("id").toString();
					 int num = Integer.parseInt(jo.get("num").toString());
					orderPartService.insert(new OrderPart(orderId, pId,num));
					Part part = partService.selectByPrimaryKey(pId);
					part.setPartNum(part.getPartNum()-num);
					partService.updateByPrimaryKeySelective(part);
				}
				
				for(String id :workers){
					orderWorkerService.insert(new OrderWorker(orderId,id));
					Worker worker = workerService.selectByPrimaryKey(id);
					worker.setwState(0);//忙碌
					workerService.updateByPrimaryKeySelective(worker);
				}
				
		} catch (Exception e) {
			success="0";
		}
		return success;
	}

	/** 修改订单*/
	@RequestMapping("/edit")
	public String edit(HttpServletRequest request,String orderId){
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("orderId", orderId);
		//通过id查出只能是一条数据
 		List<Map<String, Object>> order = orderService.selectOrderByAttr(paramMap);
 		String[] imgurls = order.get(0).get("imgUrls").toString().split(",");
 		//查询机床
    	SStation station = stationService.selectByPrimaryKey(Integer.parseInt(order.get(0).get("s_id").toString()));
 		//查询工人 0在忙 1 空闲
 		List<Map<String, Object>> selWorkers = orderWorkerService.selectByOrderId(order.get(0).get("o_id").toString());
 		//查询所有零件
 		List<Map<String, Object>> selParts = orderPartService.selectByOrderId(order.get(0).get("o_id").toString());
 		
 		//查询所有待使用的机床
 		List<SStation> stations=stationService.selectAll(new HashMap<String, Object>(){/**
			 * 
			 */
			private static final long serialVersionUID = 1L;

		{put("s_state", "完好待使用");}});
 		//查询所有空闲的工人 state=1空闲 2在忙 0离职
 		List<Worker> workers = workerService.selectWorkersByAttr(new Worker(){{setwState(1);}});
 		//查询所有可使用零件
 		List<Part> parts = partService.selectAll(new Part());
 		
 		request.setAttribute("imgurls",imgurls);
 		request.setAttribute("dealOrder",order.get(0));
 		request.setAttribute("stations",stations);
 		request.setAttribute("workers",workers);
 		request.setAttribute("parts",parts);
 		request.setAttribute("station",station);//已选中station
 		request.setAttribute("selWorkers",selWorkers);
 		request.setAttribute("selParts",selParts);
 		request.setAttribute("readonly", 0);//非只读
 		return "order/orderDetail";
	}
	
	/** 订单详情*/
	@RequestMapping("/detail")
	public String detail(HttpServletRequest request,String orderId){
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("orderId", orderId);
		//通过id查出只能是一条数据
 		List<Map<String, Object>> order = orderService.selectOrderByAttr(paramMap);
 		Map<String, Object> orderMap = order.get(0);
 		String[] imgurls = orderMap.get("imgUrls").toString().split(",");
 		if (orderMap.get("s_id")==null) {
 			request.setAttribute("station",null);
 			request.setAttribute("selWorkers",null);
 			request.setAttribute("selParts",null);
 		}else{
 			//查询机床
 			SStation station = stationService.selectByPrimaryKey(Integer.parseInt(orderMap.get("s_id").toString()));
 			//查询工人 0在忙 1 空闲
 			List<Map<String, Object>> workers = orderWorkerService.selectByOrderId(orderMap.get("o_id").toString());
 			//查询所有零件
 			List<Map<String, Object>> parts = orderPartService.selectByOrderId(orderMap.get("o_id").toString());
 			request.setAttribute("station",station);
 			request.setAttribute("selWorkers",workers);
 			request.setAttribute("selParts",parts);
 		}
 		request.setAttribute("imgurls",imgurls);
 		request.setAttribute("dealOrder",order.get(0));
 		request.setAttribute("readonly", 1);//只读
		return "order/orderDetail";
	}
	/** 订单*/
	@RequestMapping("/userOrder")
	public String userOrder(HttpServletRequest request,HttpSession sessions){
		User user= (User)sessions.getAttribute("userOn");
		Map<String,Object> paramMap=new HashMap<String, Object>();
		paramMap.put("userId", user.getuId());
		List<Map<String, Object>> orders = orderService.selectOrderByAttr(paramMap);//返回用户的多个订单
		request.setAttribute("orders", orders);
		return "order/userOrder";
	}
	@RequestMapping("/done")
	@ResponseBody
	public String doneOrder(HttpServletResponse response,HttpServletRequest request,String orderId) {
		String msg="1";
		//更新  1订单状态 2更新机床 3更新员工状态 4更新车辆状态
		List<Map<String,Object>> ws = orderWorkerService.selectByOrderId(orderId);
		Order order = orderService.selectByPrimaryKey(orderId);
		try {
			//1
			order.setEndtime(new Date());
			order.setoState("2");//2完成
			orderService.updateByPrimaryKeySelective(order);
			//2
			SStation station = stationService.selectByPrimaryKey(order.getStationId());
			station.setsState("完好待使用");
			stationService.updateByPrimaryKeySelective(station);
			//4
			Car car = carService.selectByPrimaryKey(order.getCarId());
			car.setCarState(0);
			carService.updateByPrimaryKeySelective(car);
			//3
			for (Map<String, Object> map : ws) {
				String wId= (String)map.get("w_id");
				Worker worker = workerService.selectByPrimaryKey(wId);
				worker.setwState(1);//1空闲
				workerService.updateByPrimaryKeySelective(worker);
			}
		} catch (Exception e) {
			msg="0";
		}
		return msg;
	}
	
	/** 订单*/
	@RequestMapping("/home")
	public String homePage(HttpServletRequest request,HttpSession sessions){
		List<Map<String, Object>> list= orderService.selectOrderByAttr(new HashMap<String, Object>(){/**
			 * 
			 */
			private static final long serialVersionUID = 1L;

		{put("state", 0);}});
		request.setAttribute("count", list.size());
		List<String> yearMonths = DateUtils.getYearMonths(MONTHS);//获取半年日期
		request.setAttribute("yearMonths", yearMonths);
		
		List<Part> parts = partService.selectAll(new Part());
		for (int i = 0; i < parts.size(); i++) {
			if(parts.get(i).getPartNum()>parts.get(i).getWarning()){
				parts.remove(i);
			}
		}
		request.setAttribute("parts", parts);
		return "home";
	}
	/**  */
	@RequestMapping("/reject")
	@ResponseBody
	public String rejectOrder(HttpServletRequest request,String orderId,String remark) {
		String success="1";
		//获取订单id 机床id 员工id集合 零件id num集合
		//修改订单状态 修改机床状态 更新order-worker order-part表
		try {
				
				Order order = orderService.selectByPrimaryKey(orderId);
				order.setoState("2");//3拒绝
				order.setRemark(remark);
				order.setEndtime(new Date());
				orderService.updateByPrimaryKeySelective(order);//更新order
				Car car = carService.selectByPrimaryKey(order.getCarId());
				car.setCarState(0);
				carService.updateByPrimaryKeySelective(car);
		} catch (Exception e) {
			success="0";
		}
		return success;
	}
	/**  */
	@RequestMapping("/excel")
	public void excelOrder(HttpServletRequest request, HttpServletResponse response,String state) {
		String express="";
		// 创建Excel工作簿
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 创建一个工作表sheet
		HSSFSheet sheet = workbook.createSheet();
		// 追加数据
		String[] titles = {"订单编号","用户","车辆","状态","预定时间","预计到达时间"};
		// 创建第一行
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = null;
		// 插入第一行数据 id,name,sex
		for (int i = 0; i < titles.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(titles[i]);
		}
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("state", state);
 		List<Map<String, Object>> order = orderService.selectOrderByAttr(paramMap);
		HSSFCellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		for (int i = 0; i < order.size(); i++) {
			Map<String, Object> map = order.get(i);
			if (null != map) {
				HSSFRow nextrow = sheet.createRow(1 + i);// 数据从第三行开始
				nextrow.createCell(0).setCellValue(map.get("o_id").toString());
				nextrow.createCell(1).setCellValue(map.get("userName").toString());
				nextrow.createCell(2).setCellValue(map.get("car_name").toString());
				if("0".equals(state)){
					express="正在预约";
				}else if("1".equals(state)){
					express="进行中";
				}else{
					express="已完成";
				}
				nextrow.createCell(3).setCellValue(express);
//				SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
				nextrow.createCell(4).setCellValue(map.get("orderTime").toString());
				nextrow.createCell(5).setCellValue(map.get("arriveTime").toString());
			}

		}
		try {
			// 20170913-113040850.xls
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
			String time = formatter.format(new Date());
			String fileName = URLEncoder.encode(express+"订单信息"+time + ".xls", "UTF-8");
			response.setContentType("multipart/form-data");
			// 2.设置文件头：最后一个参数是设置下载文件名(假如我们叫a.pdf)
			response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
			// 3.通过response获取ServletOutputStream对象(out)
			ServletOutputStream out = response.getOutputStream();
			workbook.write(out);
			out.close();
			out.flush();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
	}
}
