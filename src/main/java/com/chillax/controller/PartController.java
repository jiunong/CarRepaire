package com.chillax.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

import com.chillax.bean.Part;
import com.chillax.bean.Worker;
import com.chillax.service.PartService;
import com.chillax.utils.BaseController;
import com.chillax.utils.StringUtil;
import com.chillax.utils.TableData;

@Controller
@RequestMapping("/part")
public class PartController extends BaseController {
	
	@Resource
	private PartService partService;
	/**页面跳转*/
	@RequestMapping("/list")
	public String workList(HttpServletRequest request,HttpSession session,Worker worker){
		return "part/part_list";
	}
	/**数据获取*/
	@RequestMapping("/getData")
	@ResponseBody
	public String getData(HttpServletResponse response,HttpServletRequest request){
		Integer offset = Integer.parseInt(request.getParameter("offset"));//开始条数
		Integer limit = Integer.parseInt(request.getParameter("limit"));//每页条数
		String partId=request.getParameter("partId");
		Part part=new Part();
		part.setPartId(partId);
		List<Part> parts = partService.selectAll(part);
		return TableData.getJson2Table(parts, offset, limit);
	}
	/**编辑零件信息 */
	@RequestMapping("/edit")
	public String editWork(HttpServletRequest request,Model model){
		try {
			String id = request.getParameter("id");
			Part part = new Part();
			if(StringUtil.isNotEmpty(id)){
				part = partService.selectByPrimaryKey(id);
			}
			model.addAttribute("part", part);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "part/part_edit";
	}
	/**添加机床*/
	@RequestMapping("/add")
	@ResponseBody
	public Integer addWorker(HttpServletRequest request,Part part){
		int record=0;
		//设置最后编辑时间
		part.setLastbuydate(new Date());
		//获取工作人员Id
		if( StringUtil.isEmpty(part.getPartId())){
			/*设置id*/
			part.setPartId(StringUtil.getStringId());
			record= partService.insertSelective(part);
		}else{
			record= partService.updateByPrimaryKeySelective(part);
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
				partService.deleteByPrimaryKey(sId);
			}
			return 1;
		}else{
			return 0;
		}
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
		String[] titles = {"零件编号","零件名称","零件单价","剩余数量","预警值","最后编辑时间"};
		// 创建第一行
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = null;
		// 插入第一行数据 id,name,sex
		for (int i = 0; i < titles.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(titles[i]);
		}
		List<Part> list=new ArrayList<Part>();
		String[] id = ids.split(",");
		Part part=new Part();
		for (String string : id) {
			part= partService.selectByPrimaryKey(string);
			list.add(part);
		}
		HSSFCellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		for (int i = 0; i < list.size(); i++) {
			Part partEcl = list.get(i);
			if (null != partEcl) {
				HSSFRow nextrow = sheet.createRow(1 + i);// 数据从第三行开始
				nextrow.createCell(0).setCellValue(partEcl.getPartId());
				nextrow.createCell(1).setCellValue(partEcl.getPartName());
				nextrow.createCell(2).setCellValue(partEcl.getPartPrice());
				nextrow.createCell(3).setCellValue(partEcl.getPartNum());
				nextrow.createCell(4).setCellValue(partEcl.getWarning());
				nextrow.createCell(5).setCellValue(partEcl.getLastbuydate());
			}

		}
		try {
			// 20170913-113040850.xls
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
			String time = formatter.format(new Date());
			String fileName = URLEncoder.encode("零件信息"+time + ".xls", "UTF-8");
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
