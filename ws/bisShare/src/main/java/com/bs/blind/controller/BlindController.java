package com.bs.blind.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("blind")
public class BlindController {
	
	// 게시글 조회(화면)
	@GetMapping("list")
	public String list(Model model) {
		
		model.addAttribute("title", "BLIND");
		model.addAttribute("page", "blind/blind-list");

		return "layout/template";
		
	}//list
	
}//class
