package com.onnurimotors.wm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WmController {
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String Helloworld(Model model) {
		model.addAttribute("test", "test123");
		return "index";
	}
}