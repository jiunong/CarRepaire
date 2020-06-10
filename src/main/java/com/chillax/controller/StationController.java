package com.chillax.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chillax.bean.SStation;
import com.chillax.bean.Worker;
import com.chillax.service.StationService;
import com.chillax.utils.BaseController;
import com.chillax.utils.StringUtil;
import com.chillax.utils.TableData;

@Controller
@RequestMapping("/station")
public class StationController extends BaseController {
	
	@Resource
	private StationService stationService;
	/**页面跳转*/
	@RequestMapping("/list")
	public String workList(HttpServletRequest request,HttpSession session,Worker worker){
		return "station/station_list";
	}
	/**数据获取*/
	@RequestMapping("/getData")
	@ResponseBody
	public String getData(HttpServletResponse response,HttpServletRequest request){
		Integer offset = Integer.parseInt(request.getParameter("offset"));//开始条数
		Integer limit = Integer.parseInt(request.getParameter("limit"));//每页条数
		List<SStation> wList = stationService.selectAll(null);
		return TableData.getJson2Table(wList, offset, limit);
	}
	/**编辑机床信息 */
	@RequestMapping("/edit")
	public String editWork(HttpServletRequest request,Model model){
		try {
			String id = request.getParameter("id");
			SStation station = new SStation();
			if(StringUtil.isNotEmpty(id)){
				station = stationService.selectByPrimaryKey(Integer.parseInt(id));
			}
			model.addAttribute("station", station);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "station/station_edit";
	}
	/**添加机床*/
	@RequestMapping("/add")
	@ResponseBody
	public Integer addWorker(HttpServletRequest request,SStation station){
		int record=0;
		station.setBegintime(new Date());
		//获取工作人员Id
		if(station.getsId()==null){
			record= stationService.insertSelective(station);
		}else{
			record= stationService.updateByPrimaryKeySelective(station);
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
				stationService.deleteByPrimaryKey(Integer.parseInt(sId));
			}
			return 1;
		}else{
			return 0;
		}
	}
}
