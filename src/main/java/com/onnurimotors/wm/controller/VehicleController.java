package com.onnurimotors.wm.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onnurimotors.wm.model.VEHICLE;
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
		return "vehicle/add_vehicle";
	}
	@RequestMapping("/vehicle/add")
	public String addVehicle(HttpServletRequest request, Map<String,Object> model) {
		return "redirect:/list_vehicle";
	}
	
	@RequestMapping("/vehicle/{vid}/editview")
	public String editviewVehicle(HttpServletRequest request, Model model, @PathVariable int vid) {
		service.getVehicle(request, model, vid);
		return "vehicle/edit_vehicle";
	}
	
	@RequestMapping("/vehicle/{vid}/edit")
	public String editVehicle(HttpServletRequest request, Map<String,Object> model, @PathVariable int vid) {
		service.updateVehicle(request, vid);
		return "redirect:/list_management?vehicle_id="+vid;
	}
	
	@RequestMapping("/vehicle/{vid}/delete")
	public String deleteVehicle(HttpServletRequest request, Map<String,Object> model, @PathVariable int vid) {
		service.deleteVehicle(vid);
		return "redirect:/list_vehicle";
	}
	
	
	@RequestMapping("/vehicle/{vid}/managements")
	public String managements(HttpServletRequest request, Model model, @PathVariable int vid) {
		return "vehicle/add_vehicle";
	}
	@RequestMapping("/vehicle/{vid}/managements/addview")
	public String addviewManagements(HttpServletRequest request, Map<String,Object> model, @PathVariable int vid) {
		VEHICLE v = service.getOneVehicle(vid);
		model.put("vehicle", v);
		return "management/add_management";
	}
	@RequestMapping("/vehicle/{vid}/managements/add")
	public String addManagements(HttpServletRequest request, Map<String,Object> model, @PathVariable int vid) {
		service.submitManagement(request);
		return "redirect:/list_management?vehicle_id="+vid;
	}
	
	@RequestMapping("/vehicle/{vid}/managements/{mid}/delete")
	public String delManagements(HttpServletRequest request, Map<String,Object> model
			, @PathVariable int vid, @PathVariable int mid) {
		service.deleteManagement(mid);
		return "redirect:/list_management?vehicle_id="+vid;
	}
}
