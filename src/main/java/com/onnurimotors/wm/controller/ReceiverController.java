package com.onnurimotors.wm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onnurimotors.wm.model.EMPLOYEE;

@Controller
public class ReceiverController {
	
	@RequestMapping("/receivers")
	public String listReceiver(HttpServletRequest request, Map<String,Object> model) {
		List<EMPLOYEE> list = new ArrayList<EMPLOYEE>();
		EMPLOYEE e = new EMPLOYEE();
		e.setNAME("임시이름");
		e.setKAKAO_ACCOUNT("임시ID");
		e.setIS_RECEIVING_KAKAO(1);
		list.add(e);
		list.add(e);
		
		EMPLOYEE a = new EMPLOYEE();
		a.setNAME("종업원");
		a.setKAKAO_ACCOUNT("임시ID2");
		a.setIS_RECEIVING_KAKAO(0);
		list.add(a);
		
		model.put("employees", list);
		
		System.out.println("list: " + list.size());
		return "receivers/list_receivers";
	}
	@RequestMapping("/receivers/toggle")
	public String toggleReceiver(HttpServletRequest request, Map<String,Object> model) {
		return "redirect:/receivers";
	}
	
	@RequestMapping("/receivers/{empId}")
	public String detailReceiver(HttpServletRequest request, Map<String,Object> model, @PathVariable int empId) {
		
		EMPLOYEE e = new EMPLOYEE();
		e.setNAME("임시이름");
		e.setKAKAO_ACCOUNT("임시ID");
		e.setIS_RECEIVING_KAKAO(1);
		
		model.put("employee", e);
		return "receivers/detail";
	}

	@RequestMapping("/receivers/addview")
	public String addViewReceiver(HttpServletRequest request, Map<String,Object> model) {
		return "receivers/add";
	}
	
	@RequestMapping("/receivers/add")
	public String addReceiver(HttpServletRequest request, Map<String,Object> model, @ModelAttribute("emp") EMPLOYEE emp) {
		System.out.println("emp: " + emp.toString());
		return "redirect:/receivers";
	}
	
	@RequestMapping("/receivers/{empId}/editview")
	public String editViewReceiver(HttpServletRequest request, Map<String,Object> model, @PathVariable int empId) {
		EMPLOYEE e = new EMPLOYEE();
		e.setNAME("임시이름");
		e.setKAKAO_ACCOUNT("임시ID");
		e.setIS_RECEIVING_KAKAO(1);
		
		model.put("employee", e);
		
		return "receivers/edit";
	}
	@RequestMapping("/receivers/{empId}/edit")
	public String editReceiver(HttpServletRequest request, Map<String,Object> model, @PathVariable int empId, @ModelAttribute("emp") EMPLOYEE emp) {
		System.out.println("emp: " + emp.toString());
		return "redirect:/receivers/"+empId;
	}
	
	@RequestMapping("/receivers/{empId}/delete")
	public String delReceiver(HttpServletRequest request, Map<String,Object> model, @PathVariable int empId) {
		return "receivers/receivers";
	}
}
