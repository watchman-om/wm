package com.onnurimotors.wm.controller;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitter;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.onnurimotors.wm.service.WmService;

@Controller
public class WmController {

	@Autowired
	private WmService service;
	
	@RequestMapping(value="/index")
	public String index(Model model) {
		service.index(model);
		return "list_history";
	}
	
	@RequestMapping(value="/list_history")
	public String list_history(HttpServletRequest request, Model model) {
		service.listHistory(request, model, -1);
		return "list_history";
	}
	@RequestMapping(value="/history/addview")
	public String addviewHistory(HttpServletRequest request, Model model) {
		service.listHistory(request, model, -1);
		return "history/add_history";
	}
	@RequestMapping(value="/history/add")
	public String addHistory(HttpServletRequest request, Model model) {
		service.listHistory(request, model, -1);
		return "redirect:/list_history";
	}
	@RequestMapping(value="/history/{hid}/editview")
	public String editviewHistory(HttpServletRequest request, Model model, @PathVariable int hid) {
		service.listHistory(request, model, hid);
		return "history/edit_history";
	}
	@RequestMapping(value="/history/{hid}/edit")
	public String editHistory(HttpServletRequest request, Model model, @PathVariable int hid) {
		service.listHistory(request, model, -1);
		return "redirect:/list_history";
	}
	@RequestMapping(value="/history/{hid}/delete")
	public String deleteHistory(HttpServletRequest request, Model model, @PathVariable int hid) {
		service.deleteHistory(request, model, hid);
		return "redirect:/list_history";
	}
	
	
	@RequestMapping(value="/list_management")
	public String list_management(HttpServletRequest request, Model model) {
		service.listManagement(request, model);
		return "list_management";
	}
	
	@RequestMapping(value="/form_management")
	public String form_management(HttpServletRequest request, Model model) {
		service.getManagementCondition(request, model);
		return "form_management";
	}
	
	@RequestMapping(value="/form_vehicle")
	public String form_vehicle(HttpServletRequest request, Model model) {
		service.getVehicleCondition(request, model);
		return "form_vehicle";
	}
	
	@RequestMapping(value="/dbviewer")
	public String dbviewer(Model model) {
		service.dbViewer(model);
		return "dbviewer";
	}
	
	@RequestMapping("/sstestview")
	public String sstestview() {
		return "ssetest";
	}

    @RequestMapping("/sseTest")
    public ResponseBodyEmitter handleRequest (HttpServletRequest request) {

        final SseEmitter emitter = new SseEmitter();
        ExecutorService executorService = Executors.newSingleThreadExecutor();
        executorService.execute(() -> {
            for (int i = 0; i < 500; i++) {
                try {
                    emitter.send(service.getVehicle(request, null, -1));
                    Thread.sleep(2000);
                } catch (Exception e) {
                    e.printStackTrace();
                    emitter.completeWithError(e);
                    return;
                }
            }
            emitter.complete();
        });

        return emitter;
    }

    @RequestMapping("/sse/history")
    public ResponseBodyEmitter sse_history(HttpServletRequest request) {
    	return service.sseHistory(request);
    }

    @RequestMapping("/sse/history/count")
    public ResponseBodyEmitter sse_history_page(HttpServletRequest request) {
    	return service.sseHistoryCount(request);
    }

    @RequestMapping("/sse/vehicle")
    public ResponseBodyEmitter sse_vehicle(HttpServletRequest request) {
    	return service.sseVehicle(request);
    }

    @RequestMapping("/sse/vehicle/count")
    public ResponseBodyEmitter sse_vehicle_page(HttpServletRequest request) {
    	return service.sseVehicleCount(request);
    }

    @RequestMapping("/testPost")
    public String testPost(HttpServletRequest request) {
    	return "/exPost";
    }

    @RequestMapping("/sse/employee")
    public ResponseBodyEmitter sse_employee(HttpServletRequest request) {
    	return service.sseEmployee(request);
    }

    @RequestMapping("/sse/employee/count")
    public ResponseBodyEmitter sse_employee_page(HttpServletRequest request) {
    	return service.sseEmployeeCount(request);
    }
}