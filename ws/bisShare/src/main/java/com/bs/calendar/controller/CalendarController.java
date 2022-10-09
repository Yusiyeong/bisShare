package com.bs.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CalendarController {

	
	//일정 메인
	@GetMapping("calendar/main")
	public String main(Model model) {
		model.addAttribute("page", "calendar/calendar-main");
		return "layout/template";
	}
	
	
	//일정 작성
	@GetMapping("calendar/write")
	public String write(Model model) {
		model.addAttribute("page", "calendar/calendar-write");
		return "layout/template";
	}
	
	
	//일정 수정
	@GetMapping("calendar/edit")
	public String edit(Model model) {
		model.addAttribute("page", "calendar/calendar-edit");
		return "layout/template";
	}
	
	
	//일정 조회
	@GetMapping("calendar/view")
	public String view(Model model) {
		model.addAttribute("page", "calendar/calendar-view");
		return "layout/template";
	}
	
	
	
}
