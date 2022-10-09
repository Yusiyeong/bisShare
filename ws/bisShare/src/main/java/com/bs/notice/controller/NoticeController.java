package com.bs.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("notice")
public class NoticeController {

	// 게시글 조회(화면)
	@GetMapping("list")
	public String list(Model model) {

		model.addAttribute("title", "NOTICE");
		model.addAttribute("page", "notice/notice-list");

		return "layout/template";

	}//list
	

	// 게시글 작성(화면)
	@GetMapping("write")
	public String write(Model model) {
		
		model.addAttribute("title", "WRITE");
		model.addAttribute("page", "notice/notice-write");

		return "layout/template";

	}//write
		
}//class
