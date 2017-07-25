package com.onnurimotors.wm.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onnurimotors.wm.model.HISTORY;
import com.onnurimotors.wm.model.MANAGEMENT;
import com.onnurimotors.wm.model.MANAGEMENT_DATE;
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
	
	@RequestMapping("/vehicle/{vid}/history/{dv}/managements/addview")
	public String addviewManagements(HttpServletRequest request, Map<String,Object> model, @PathVariable int vid, @PathVariable String dv) {
		VEHICLE v = service.getOneVehicle(vid);
		model.put("vehicle", v);
		ArrayList<HISTORY> h = (ArrayList<HISTORY>) service.getAllHistory(null, (Model) model, dv);
		model.put("historys", h);
		return "management/add_management";
	}
	
	@RequestMapping("/vehicle/{vid}/history/{dv}/managements/add")
	public String addManagements(HttpServletRequest request, Map<String,Object> model, @PathVariable int vid, @PathVariable String dv) {
		service.submitManagement(request);
		return "redirect:/vehicle/"+vid+"/history/"+dv+"/managements";
	}
	
	@RequestMapping("/vehicle/{vid}/managements/{mid}/delete")
	public String delManagements(HttpServletRequest request, Map<String,Object> model
			, @PathVariable int vid, @PathVariable int mid) {
		service.deleteManagement(mid);
		return "redirect:/list_management?vehicle_id="+vid;
	}
	
	@RequestMapping(value="/vehicle/{vid}/managements/{mid}/editview")
	public String editviewManagement(HttpServletRequest request, Map<String,Object> model, @PathVariable int vid, @PathVariable int mid) {
		VEHICLE v = service.getOneVehicle(vid);
		model.put("vehicle", v);
		MANAGEMENT_DATE md = service.getOneManagement(mid);
		model.put("management", md);
		return "management/edit_management";
	}
	
	@RequestMapping("/vehicle/{vid}/managements/{mid}/edit")
	public String editManagements(HttpServletRequest request, Map<String,Object> model, @PathVariable int vid) {
		service.submitManagement(request);
		return "redirect:/list_management?vehicle_id="+vid;
	}
	
	@RequestMapping("/vehicle/{vid}/history/{date_visit}/managements")
	public String detailviewManagement(HttpServletRequest request, Map<String,Object> model, @PathVariable int vid, @PathVariable String date_visit) {
		model.put("vehicle_id", vid);
		System.out.println(date_visit);
		service.getManagementByHistory(request, model, vid, date_visit);
		return "list_management_detail";
	}
}
