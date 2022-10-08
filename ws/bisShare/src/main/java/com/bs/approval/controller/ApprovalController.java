package com.bs.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApprovalController {

	
	//결재 작성
	@GetMapping("approval/write")
	public String write(Model model) {
		model.addAttribute("page", "approval/approval-write");
		return "layout/template";
	}

	
	
	
	
}//class
