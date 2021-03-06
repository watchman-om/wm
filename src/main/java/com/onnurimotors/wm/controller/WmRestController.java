package com.onnurimotors.wm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.onnurimotors.wm.service.ReceiverService;
import com.onnurimotors.wm.service.WmService;

@RestController
public class WmRestController {

	@Autowired
	private WmService service;

	@Autowired
	private ReceiverService rSerivce;
	
	@RequestMapping(value="/visit", method = RequestMethod.POST)
	public Object visit(HttpServletRequest request) {
		return service.visit(request);
	}
	
	@RequestMapping(value="/alerts", method = RequestMethod.POST)
	public Object alerts() {
		return service.getAlerts(null);
	}
	
	@RequestMapping(value="/vehicle", method = RequestMethod.GET)
	public Object vehicle_get(HttpServletRequest request) {
		return service.getVehicle(request, null, -1);
	}
	
	@RequestMapping(value="/vehicle/{vehicle_id}", method = RequestMethod.GET)
	public Object vehicle_get_one(@PathVariable int vehicle_id) {
		return service.getOneVehicle(vehicle_id);
	}
	
	@RequestMapping(value="/vehicle", method = RequestMethod.POST)
	public Object vehicle_post(HttpServletRequest request) {
		return service.insertVehicle(request);
	}
	
	@RequestMapping(value="/vehicle/{vehicle_id}", method = RequestMethod.POST)
	public Object vehicle_put(HttpServletRequest request) {
		System.out.println(request.getParameter("LICENSE"));
		return service.updateVehicle(request, -1);
	}
	
	@RequestMapping(value="/vehicle/{vehicle_id}", method = RequestMethod.DELETE)
	public Object vehicle_delete(@PathVariable int vehicle_id) {
		return service.deleteVehicle(vehicle_id);
	}
	
	@RequestMapping(value="/history", method = RequestMethod.GET)
	public Object history(HttpServletRequest request) {
		return service.getAllHistory(request, null, "");
	}

	@RequestMapping(value={"/historyvehicle", "/vehiclehistory"}, method = RequestMethod.GET)
	public Object history_vehicle(HttpServletRequest request) {
		return service.getVehicleHistory(request);
	}
	
	@RequestMapping(value="/employee", method = RequestMethod.POST)
	public Object employee(HttpServletRequest request) {
		return rSerivce.getEmployee(request, null, -1);
	}
	
	@RequestMapping(value="/history_management", method = RequestMethod.POST)
	public Object vehicle_management(HttpServletRequest request) {
		return service.getHistoryManagement(request, null);
	}
	
	@RequestMapping(value="/management", method = RequestMethod.POST)
	public Object management(HttpServletRequest request) {
		return service.getManagement(request, null);
	}
	
	@RequestMapping(value="/toggle_notifiable", method = RequestMethod.POST)
	public Object toggle_notifiable(HttpServletRequest request) {
		return service.toggleNotifiable(request);
	}
	
	@RequestMapping(value="/update_vehicle_model", method = RequestMethod.POST)
	public Object update_vehicle_model(HttpServletRequest request) {
		return service.updateVehicleModel(request);
	}
	
	@RequestMapping(value="/update_vehicle_user_name", method = RequestMethod.POST)
	public Object update_vehicle_user_name(HttpServletRequest request) {
		return service.updateVehicleUserName(request);
	}
	
	@RequestMapping(value="/update_vehicle_phone_number", method = RequestMethod.POST)
	public Object update_vehicle_phone_number(HttpServletRequest request) {
		return service.updateVehiclePhoneNumber(request);
	}
	
	@RequestMapping(value="/update_vehicle_birth", method = RequestMethod.POST)
	public Object update_vehicle_birth(HttpServletRequest request) {
		return service.updateVehicleBirth(request);
	}
	
	@RequestMapping(value="/update_vehicle_comment", method = RequestMethod.POST)
	public Object update_vehicle_comment(HttpServletRequest request) {
		return service.updateVehicleComment(request);
	}
	
	@RequestMapping(value="/toggle_receiving_kakao", method = RequestMethod.POST)
	public Object toggle_receiving_kakao(HttpServletRequest request) {
		return service.toggleReceivingKakao(request);
	}
	
	@RequestMapping(value="/makeDB", method = RequestMethod.GET)
	public String makeDB() {
		return service.generateDB();
	}
	
	@RequestMapping(value="/clearDB", method = RequestMethod.GET)
	public String clearDB() {
		return service.regenerateDB();
	}
	
	@RequestMapping(value="/updateDB", method = RequestMethod.GET)
	public String updateDB() {
		return service.modifyDB();
	}
}
