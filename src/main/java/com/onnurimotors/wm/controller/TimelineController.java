package com.onnurimotors.wm.controller;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onnurimotors.wm.service.WmService;

@Controller
public class TimelineController {
	
	@Autowired
	private WmService service;

	@RequestMapping(value="/timeline")
	public String timeline(HttpServletRequest request, Model model) {
		service.getManagementCondition(request, model);
		return "timeline/timeline";
	}
}
