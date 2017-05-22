package com.onnurimotors.wm.controller;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onnurimotors.wm.service.WmService;

@Controller
public class WmController {

	@Autowired
	private WmService service;
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String index(Model model) {
		service.index(model);
		return "index";
	}
	
	@RequestMapping(value="/list_vehicle", method = RequestMethod.GET)
	public String list_vehicle(HttpServletRequest request, Model model) {
		service.list_vehicle(request, model);
		return "list_vehicle";
	}
	
	@RequestMapping(value="/testPost", method = RequestMethod.GET)
	public String testPost() {
		return "exPost";
	}
	
	@RequestMapping(value="/dbviewer", method = RequestMethod.GET)
	public String dbviewer(Model model) {
		service.dbviewer(model);
		return "dbviewer";
	}
}