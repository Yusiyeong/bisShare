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
	
}//class
