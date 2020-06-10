package com.chillax.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/frame")
public class FrameController {

	@RequestMapping("/index")
	public String userList(HttpServletRequest request,Model model){
		
		return "index";
	}
}
