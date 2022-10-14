package com.bs.free.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("free")
public class FreeController {

	// 게시글 조회(화면)
	@GetMapping("list")
	public String list(Model model) {

		model.addAttribute("title", "FREE");
		model.addAttribute("page", "free/list");

		return "layout/template";

	}//list
	
	// 게시글 작성(화면)
	@GetMapping("write")
	public String write(Model model) {
		
		model.addAttribute("title", "WRITE");
		model.addAttribute("page", "free/write");

		return "layout/template";

	}//write
	
	// 게시글 상세조회(화면)
	@GetMapping("detail")
	public String detail(Model model) {

		model.addAttribute("title", "POST");
		model.addAttribute("page", "free/detail");

		return "layout/template";
		
	}//detail
	
}//class
