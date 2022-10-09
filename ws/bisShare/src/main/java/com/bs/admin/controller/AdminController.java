package com.bs.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {

	// 게시글 조회(화면)
	@GetMapping("list")
	public String list(Model model) {
		
		model.addAttribute("title", "MEMBER LIST");
		model.addAttribute("page", "admin/member-list");

		return "layout/template";
		
	}//list
	
	
	
}//class
