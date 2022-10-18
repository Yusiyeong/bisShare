package com.bs.calendar.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bs.calendar.service.CalendarService;
import com.bs.calendar.vo.CalendarVo;
import com.bs.employee.vo.EmployeeVo;

@Controller
@RequestMapping("calendar")
public class CalendarController {
	
	private final CalendarService cs;
	
	@Autowired
	public CalendarController(CalendarService cs) {
		this.cs = cs;
	}
	
	
	
	//일정 메인
	@GetMapping("calendar/main")
	public String main(Model model) {
		model.addAttribute("page", "calendar/calendar-main");
		return "layout/template";
	}
	
	
	
	//일정 작성 (화면)
	@GetMapping("calendar/write")
	public String write(Model model) {
		model.addAttribute("page", "calendar/calendar-write");
		return "layout/template";
	}
	
	//일정 작성
	@PostMapping("calendar/write")
	public String write(CalendarVo vo, Model model, HttpSession session) {
		
		EmployeeVo loginvo = (EmployeeVo)session.getAttribute("loginvo");
		String no = loginvo.getEmpNo();
		
		int result = cs.write(vo);
		
		//화면 선택
		if(result == 1) {
			session.setAttribute("alertMsg", "일정 등록 완료");
			return "layout/template";
		}else {
			model.addAttribute("msg" , "일정 등록 실패");
			return "error/errorPage";
		}
		
	}
	
	
	 
	//일정 수정
	@GetMapping("calendar/edit")
	public String edit(@PathVariable String no, CalendarVo vo, HttpSession session) {
		return "layout/template";
	}
	
	
	
	//일정 삭제
	@GetMapping("calendar/delete{no}")
	public String delete(@PathVariable String no , HttpSession session , Model model) {
		
		int result = cs.delete(no);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "일정이 삭제되었습니다.");
			return "layout/template";
		}else {
			model.addAttribute("msg", "일정 삭제 실패");
			return "layout/template";
		}
	}
	
	
	
	//일정 조회
	@GetMapping("calendar/view")
	public String view(Model model) {
		model.addAttribute("page", "calendar/calendar-view");
		return "layout/template"; 
	}
	
	//일정 상세 조회
	@GetMapping("calendar/detail")
	public String detail(Model model) {
		model.addAttribute("page", "calendar/calendar-detail");
		return "layout/template";
	}
	
	
	
	
}
