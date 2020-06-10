package com.chillax.controller;

import java.io.IOException;
import java.net.URLEncoder;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chillax.bean.Worker;
import com.chillax.service.WorkerService;
import com.chillax.utils.BaseController;
import com.chillax.utils.DateUtils;
import com.chillax.utils.StringUtil;
import com.chillax.utils.TableData;

@Controller
@RequestMapping("/worker")
public class WorkerController extends BaseController {
	
	@Resource
	private WorkerService workerService;
	/**页面跳转*/
	@RequestMapping("/list")
	public String workList(HttpServletRequest request,HttpSession session,Worker worker){
		return "worker/worker_list";
	}
	/**数据获取*/
	@RequestMapping("/getData")
	@ResponseBody
	public String getData(HttpServletResponse response,HttpServletRequest request){
		Integer offset = Integer.parseInt(request.getParameter("offset"));//开始条数
		Integer limit = Integer.parseInt(request.getParameter("limit"));//每页条数
		Worker worker=new Worker();
		String workerName=request.getParameter("workerName");
		worker.setwName(workerName);
		List<Worker> wList = workerService.selectWorkersByAttr(worker);
		return TableData.getJson2Table(wList, offset, limit);
	}
	/**编辑员工信息 */
	@RequestMapping("/edit")
	public String addWork(HttpServletRequest request,Model model){
		try {
			String id = request.getParameter("id");
			Worker worker = null;
			if(StringUtil.isEmpty(id)){
				worker = new Worker();
			}else{
				worker = workerService.selectByPrimaryKey(id);
			}
			model.addAttribute("worker", worker);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "worker/worker_edit";
	}
	/**添加员工*/
	@RequestMapping("/add")
	@ResponseBody
	public Integer addWorker(HttpServletRequest request,Worker worker){
		int record;
		//获取工作人员Id
		if(StringUtil.isEmpty(worker.getwId())){
			worker.setwId(StringUtil.getStringId());
			record= workerService.insertSelective(worker);
		}else{
			record= workerService.updateByPrimaryKeySelective(worker);
		}
		return record;
	}
	/**删除员工*/
	@RequestMapping("/delById")
	@ResponseBody
	public Integer deleteWorker(HttpServletRequest request){
		String ids = request.getParameter("id");
		if(StringUtil.isNotEmpty(ids)){
			String[] wIds = ids.split(",");
			for (String wId : wIds) {
				workerService.deleteByPrimaryKey(wId);
			}
			return 1;
		}else{
			return 0;
		}
	}
	
	@RequestMapping("/getWorkData")
	@ResponseBody
	public List<Map<String,Object>> getWorkData(HttpServletRequest request,String month){
		Map<String,Object> param =new  HashMap<String, Object>();
		if (StringUtil.isEmpty(month)) {
			month=DateUtils.getYearMonths(1).get(0);
		}
		param.put("date", month);
		List<Map<String,Object>> selectWork = workerService.selectWork(param);
		request.setAttribute("selMonth", month);
		return selectWork;
	}
	
	
	/**
	 * 
	 */
	@RequestMapping("/excel")
	public void getdatatoexcel(HttpServletRequest request, HttpServletResponse response, String ids) {
		// 创建Excel工作簿
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 创建一个工作表sheet
		HSSFSheet sheet = workbook.createSheet();
		// 追加数据
		String[] titles = {"员工姓名","年龄","性别","员工电话","员工职位",
				"员工薪水","身份证信息","家庭住址"};
		// 创建第一行
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = null;
		// 插入第一行数据 id,name,sex
		for (int i = 0; i < titles.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(titles[i]);
		}
		List<Worker> list=new ArrayList<Worker>();
		String[] id = ids.split(",");
		Worker worker=new Worker();
		for (String string : id) {
			worker= workerService.selectByPrimaryKey(string);
			list.add(worker);
		}
		HSSFCellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		for (int i = 0; i < list.size(); i++) {
			Worker  partEcl = list.get(i);
			if (null != partEcl) {
				HSSFRow nextrow = sheet.createRow(1 + i);// 数据从第三行开始
				nextrow.createCell(0).setCellValue(partEcl.getwName());
				nextrow.createCell(1).setCellValue(partEcl.getwAge());
				nextrow.createCell(2).setCellValue(partEcl.getwSex()==0?"男":"女");
				nextrow.createCell(3).setCellValue(partEcl.getwPhone());
				nextrow.createCell(4).setCellValue(partEcl.getwLevel());
				nextrow.createCell(4).setCellValue(partEcl.getwSalary());
				nextrow.createCell(4).setCellValue(partEcl.getwIdcard());
				nextrow.createCell(4).setCellValue(partEcl.getwLocation());
			}

		}
		try {
			// 20170913-113040850.xls
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
			String time = formatter.format(new Date());
			String fileName = URLEncoder.encode("员工信息"+time + ".xls", "UTF-8");
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
