package com.onnurimotors.wm.controller;

import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		return "index";
	}
	
	@RequestMapping("/list_vehicle")
	public String list_vehicle(HttpServletRequest request, Model model) {
		service.listVehicle(request, model);
		return "list_vehicle";
	}
	
	@RequestMapping(value="/list_history")
	public String list_history(HttpServletRequest request, Model model) {
		service.listHistory(request, model);
		return "list_history";
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
	
	@RequestMapping(value="/testPost")
	public String testPost() {
		return "exPost";
	}
	
	@RequestMapping(value="/dbviewer")
	public String dbviewer(Model model) {
		service.dbViewer(model);
		return "dbviewer";
	}
	@RequestMapping(value="/timeline")
	public String timeline(HttpServletRequest request, Model model) {
		service.listHistory(request, model);
		return "timeline";
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
                    emitter.send(service.getVehicle(request, null));
                    Thread.sleep(5000);
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
}