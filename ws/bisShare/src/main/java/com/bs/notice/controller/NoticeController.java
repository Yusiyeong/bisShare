package com.bs.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bs.notice.service.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {

	private final NoticeService bs;
	
	// 생성자
	@Autowired
	public NoticeController(NoticeService bs) {
		super();
		this.bs = bs;
	}


	// 게시글 작성(화면)
	@GetMapping("write")
	public String write(Model model) {
		
		model.addAttribute("title", "WRITE");
		model.addAttribute("page", "notice/write");
		
		return "layout/template";
		
	}//write
	
	// 게시글 목록 조회(화면+진행)
	@GetMapping("list")
	public String list(Model model) {

		model.addAttribute("title", "NOTICE");
		model.addAttribute("page", "notice/list");

		return "layout/template";

	}//list
	

	// 게시글 상세조회(화면)
	@GetMapping("detail")
	public String detail(Model model) {

		model.addAttribute("title", "POST");
		model.addAttribute("page", "notice/detail");

		return "layout/template";
		
	}//detail
		
		
}//class
