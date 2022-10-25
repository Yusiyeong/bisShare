package com.bs.calendar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.bs.common.PageVo;
import com.bs.common.Pagination;
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
	@GetMapping("main")
	public String main(Model model) {
		model.addAttribute("page", "calendar/calendar-main");
		return "layout/template";
	}
	
	//일정 캘린더에서 드래그로 작성
	@PostMapping("modalWrite")
	public String modalWrite(CalendarVo vo, Model model, HttpSession session) {
		
		EmployeeVo loginvo = (EmployeeVo)session.getAttribute("loginVo");
		String no = loginvo.getEmpNo();
		
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		vo.setWriter(no);
		int result = cs.modalwrite(vo);
		
		System.out.println(result);
		
		//화면 선택
		if(result == 1) {
			session.setAttribute("alertMsg", "일정 등록 완료");
			model.addAttribute("page", "calendar/calendar-view");
			return "layout/template";
		}else {
			session.setAttribute("msg" , "일정 등록 실패");
			return "error/errorPage";
		}
		
	}
	
	
	//일정 작성 (화면)
	@GetMapping("write")
	public String write(Model model) {
		model.addAttribute("title", "CALENDAR");
		model.addAttribute("page", "calendar/calendar-write");
		return "layout/template";
	}
	
	//일정 작성
	@PostMapping("write")
	public String write(CalendarVo vo, Model model, HttpSession session) {
		
		EmployeeVo loginvo = (EmployeeVo)session.getAttribute("loginVo");
		String no = loginvo.getEmpNo();
		
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		vo.setWriter(no);
		int result = cs.write(vo);
		
		System.out.println(result);
		
		//화면 선택
		if(result == 1) {
			session.setAttribute("alertMsg", "일정 등록 완료");
			model.addAttribute("page", "calendar/calendar-view");
			return "layout/template";
		}else {
			session.setAttribute("msg" , "일정 등록 실패");
			return "error/errorPage";
		}
		
	}
	
	
	 
	//일정 수정
	@GetMapping("edit{no}")
	public String edit(@PathVariable String no, Model model, CalendarVo vo, HttpSession session) {
		
		vo.setCalNo(no);
		
		int result = cs.edit(vo);
		
		if(result == 1) {
			model.addAttribute("alertMsg", "일정수정 성공");
			return "layout/template";
		}else {
			model.addAttribute("alertMsg", "일정 수정 실패");
			return "layout/template";
		}
		
	}
	
	
	
	//일정 삭제
	@GetMapping("delete/{no}")
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
	@GetMapping("view/{pno}")
	public String view(Model model, @PathVariable int pno, HttpServletRequest req) {
		model.addAttribute("page", "calendar/calendar-view");
		
		int totalCount = cs.selectToatalCnt();
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		//데이터 조회
		List<CalendarVo> cvoList = cs.selectList(pv);
		
		model.addAttribute("cvoList", cvoList);
		model.addAttribute("pv", pv);
		
		return "layout/template"; 
	}
	
	
	//일정 상세 조회
	@GetMapping("detail/{no}")
	public String detail(@PathVariable String no, Model model) {
		model.addAttribute("page", "calendar/calendar-detail");
		
		CalendarVo cvo = cs.selectOne(no);
		
		model.addAttribute("cvo", cvo);
		
		return "layout/template";
	}
	
	
	
	
}
