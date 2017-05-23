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
	
	@RequestMapping("/list_vehicle")
	public String list_vehicle(HttpServletRequest request, Model model) {
		service.listVehicle(request, model);
		return "list_vehicle";
	}
	
	@RequestMapping(value="/list_history", method = RequestMethod.GET)
	public String list_history(HttpServletRequest request, Model model) {
		service.listHistory(request, model);
		return "list_history";
	}
	
	@RequestMapping(value="/list_management", method = RequestMethod.GET)
	public String list_management(HttpServletRequest request, Model model) {
		service.listManagement(request, model);
		return "list_management";
	}
	
	@RequestMapping(value="/form_management", method = RequestMethod.GET)
	public String form_management(HttpServletRequest request, Model model) {
		return "form_management";
	}
	
	@RequestMapping(value="/testPost", method = RequestMethod.GET)
	public String testPost() {
		return "exPost";
	}
	
	@RequestMapping(value="/dbviewer", method = RequestMethod.GET)
	public String dbviewer(Model model) {
		service.dbViewer(model);
		return "dbviewer";
	}
}