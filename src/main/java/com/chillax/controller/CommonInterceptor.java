package com.chillax.controller;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.chillax.bean.User;

public class CommonInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws ServletException, Exception {
		
        HttpSession session = request.getSession();  
        User user= (User)session.getAttribute("user");
	        if(user == null ){
	        	session.setAttribute("msg", "您还没有登录或登录已超时，请重新登录，然后再刷新本功能！");
//	        	request.setAttribute("msg", "您还没有登录或登录已超时，请重新登录，然后再刷新本功能！");
	        	response.sendRedirect(request.getContextPath());
//	        	request.getRequestDispatcher("/").forward(request, response);
	            return false;  
	        }
        return true;  
		}

	
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) {

	}

	
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
//		System.out.println("----------------------异常时拦截------------------");
	}
}
