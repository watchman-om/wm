package com.onnurimotors.wm.controller;

import java.util.Map;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReceiverController {
	
	@RequestMapping("/receivers")
	public String listReceiver(HttpServletRequest request, Map<String,Object> model) {
		return "receivers/list_receivers";
	}
	
	@RequestMapping("/receivers/detail")
	public String detailReceiver(HttpServletRequest request, Map<String,Object> model) {
		return "receivers/detail";
	}
	
	@RequestMapping("/receivers/add")
	public String addReceiver(HttpServletRequest request, Map<String,Object> model) {
		return "receivers/add";
	}
	
	@RequestMapping("/receivers/delete")
	public String delReceiver(HttpServletRequest request, Map<String,Object> model) {
		return "receivers/list_receivers";
	}
}
