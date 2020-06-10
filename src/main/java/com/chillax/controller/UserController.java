package com.chillax.controller;


import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chillax.bean.User;
import com.chillax.service.UserService;
import com.chillax.utils.BaseController;
import com.chillax.utils.StringUtil;
import com.chillax.utils.TableData;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/list")
	public String login(HttpServletRequest request,HttpSession session,User user){
		return "user/user_list";
	}
	/**
	 * 跳转至注册页面
	 * @return
	 */
	@RequestMapping("/toPage")
	public String toPage(){
		return "user/signUp";
	}

	/**
	 * 用户注册 uLevel默认为0 用户模式
	 * @param user
	 * @return 提示信息
	 */
	@RequestMapping("/signUp")
	@ResponseBody
	public int signUp(User user){
		int signUp =0;
		if(user!=null){
			signUp= userService.insertSelective(user);
		}
		return  signUp>0?0:1;
	}
	/**
	 * 验证登陆 成功跳转至管理页面 失败返回登录
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping("/login")
	public String login(User user,HttpSession session,Model model){
		String uri="";
		List<User> checkUserLogin = userService.checkUserLogin(user);
			if (checkUserLogin!=null && checkUserLogin.size()>0) {
				User user2 = checkUserLogin.get(0);
				session.setAttribute("userOn",user2 );
				session.setAttribute("msg", null);
				uri="index";
			}else{
				session.setAttribute("msg", "用户名或者密码错误");
				uri="redirect:/";
			}
		return uri;
	}
	@RequestMapping("/out")
	public String out(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	/**数据获取*/
	@RequestMapping("/getData")
	@ResponseBody
	public String getData(HttpServletResponse response,HttpServletRequest request,String userName){
		Integer offset = Integer.parseInt(request.getParameter("offset"));//开始条数
		Integer limit = Integer.parseInt(request.getParameter("limit"));//每页条数
		HashMap<String, Object> paramMap = new HashMap<String,Object>();
		paramMap.put("userName", userName);
	    List<User> users = userService.selectAll(paramMap);
	    return TableData.getJson2Table(users, offset, limit);
	}
	@RequestMapping("/edit")
	public String editWork(HttpServletRequest request,Model model){
		try {
			String id = request.getParameter("id");
			User user=new User();
			if(StringUtil.isNotEmpty(id)){
				user = userService.selectByPrimaryKey(Integer.parseInt(id));
			}
			model.addAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "user/user_edit";
	}
	@RequestMapping("/add")
	@ResponseBody
	public Integer addWorker(HttpServletRequest request,User user){
		int record=0;
		//设置用户等级 默认为0
		if(user.getuLevel()==null){
			user.setuLevel(0);
		}
		if( user.getuId()==null){
			/*设置id*/
			record= userService.insertSelective(user);
		}else{
			record= userService.updateByPrimaryKeySelective(user);
		}
		return record;
	}
	@RequestMapping("/delById")
	@ResponseBody
	public Integer deleteWorker(HttpServletRequest request){
		String ids = request.getParameter("id");
		if(StringUtil.isNotEmpty(ids)){
			String[] sIds = ids.split(",");
			for (String sId : sIds) {
				userService.deleteByPrimaryKey(Integer.parseInt(sId));
			}
			return 1;
		}else{
			return 0;
		}
	}
}
