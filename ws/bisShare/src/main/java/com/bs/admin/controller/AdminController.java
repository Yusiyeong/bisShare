package com.bs.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {

	// 사원 관리 조회(화면)
	@GetMapping("list")
	public String list(Model model) {
		
		model.addAttribute("title", "MEMBER LIST");
		model.addAttribute("page", "admin/member-list");

		return "layout/template";
		
	}//list
	
	
	// 사원 등록(화면)
	@GetMapping("enroll")
	public String enroll(Model model) {
		
		model.addAttribute("title", "MEMBER ENROLL");
		model.addAttribute("page", "admin/member-enroll");

		return "layout/template";
		
	}//enroll
	
	
}//class
