package com.onnurimotors.wm.controller;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onnurimotors.wm.service.WmService;

@Controller
public class VehicleController {

	@Autowired
	private WmService service;
	
	@RequestMapping("/list_vehicle")
	public String list_vehicle(HttpServletRequest request, Model model) {
		service.listVehicle(request, model);
		return "list_vehicle";
	}
	
	@RequestMapping("/vehicle/addview")
	public String addviewVehicle(HttpServletRequest request, Model model) {
		service.listVehicle(request, model);
		return "vehicle/add_vehicle";
	}
}
