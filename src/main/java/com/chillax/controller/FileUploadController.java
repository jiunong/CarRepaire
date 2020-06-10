package com.chillax.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
@Controller
@RequestMapping("/upload")
public class FileUploadController  {
	
	
	@SuppressWarnings("deprecation")
	@RequestMapping("/pics")  
	@ResponseBody  
	public  Map<String, Object> uplpad(MultipartFile file, HttpServletRequest request) {  
	    String desFilePath = "";  
	    String oriName = "";  
	    Map<String, Object> dataMap = new HashMap<>();  
	    try {  
	        // 1.获取原文件名  
	        oriName = file.getOriginalFilename();  
	        // 2.获取原文件图片后缀，以最后的.作为截取(.jpg)  
	        String extName = oriName.substring(oriName.lastIndexOf("."));  
	        // 3.生成自定义的新文件名，这里以UUID.jpg|png|xxx作为格式（可选操作，也可以不自定义新文件名）  
	        String uuid = UUID.randomUUID().toString();  
	        String newName = uuid + extName;  
	        // 4.获取要保存的路径文件夹  
	        String realPath = request.getRealPath("static/images/car");  
	        // 5.保存图片  
	        desFilePath = realPath + "\\" + newName;  
	        File desFile = new File(desFilePath);  
	        file.transferTo(desFile);  
	        // 6.返回保存结果信息  
	        dataMap.put("src","static/images/car/" + newName);
	        dataMap.put("code", 0);
	        dataMap.put("msg","上传成功！");  
	    } catch (IllegalStateException e) {  
	    	 dataMap.put("code", 1);
	        System.out.println(desFilePath + "图片保存失败");  
	    } catch (IOException e) {  
	    	 dataMap.put("code", 1);
	        System.out.println(desFilePath + "图片保存失败--IO异常");  
	    }  
	    return dataMap;  
	}  
	
}
