package com.bs.calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	//일정 메인 (캘린더에서 데이터 조회)
	@GetMapping("main")
	public String main(ModelAndView mv, HttpServletRequest request, Model model, HttpSession session) {
		model.addAttribute("page", "calendar/calendar-main");
		
		EmployeeVo loginvo = (EmployeeVo)session.getAttribute("loginVo");
		String no = loginvo.getEmpNo();

		List<CalendarVo> calendar = cs.getCalendar(loginvo);
		request.setAttribute("calendarList", calendar);
		System.out.println(calendar);
		
		return "layout/template";
	}
	

	//일정 메인에서 모달로 상세정보 조회
	
	//일정 캘린더에서 모달로 일정 작성

	//메인에서 모달로 일정 수정
	
	//메인에서 모달로 일정 삭제

	
	
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
		
		vo.setWriter(no);
		int result = cs.write(vo);
		
		
		//화면 선택
		if(result == 1) {
			session.setAttribute("alertMsg", "일정 등록 완료");
			return "redirect:/calendar/view/1";
		}else {
			session.setAttribute("alertMsg" , "일정 등록 실패");
			return "redirect:/calendar/view/1";
		}
		
	}
	
	
	//일정 수정 (화면)
	@GetMapping("edit/{no}")
	public String edit(Model model, @PathVariable String no) {
		CalendarVo cvo = cs.selectOne(no);
		model.addAttribute("page", "calendar/calendar-edit");
		model.addAttribute("cvo", cvo);
		return "layout/template";
	}
	
	//일정 수정
	@PostMapping("edit/{no}")
	public String edit(@PathVariable String no, Model model, CalendarVo vo, HttpSession session) {
		
		vo.setCalNo(no);
		
		int result = cs.edit(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "일정 수정 완료");
			return "redirect:/calendar/view/1";
		}else {
			session.setAttribute("alertMsg", "일정 수정 실패");
			return "redirect:/calendar/view/1";
		}
		
	}
	
	
	
	//일정 삭제
	@GetMapping("delete/{no}")
	public String delete(@PathVariable String no , HttpSession session , Model model) {
		
		int result = cs.delete(no);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "일정이 삭제되었습니다.");
			return "redirect:/calendar/view/1";
		}else {
			session.setAttribute("alertMsg", "일정 삭제 실패");
			return "redirect:/calendar/view/1";
		}
	}
	
	
	
	//일정 조회
	@GetMapping("view/{pno}")
	public String view(Model model, @PathVariable int pno, HttpServletRequest req, HttpSession session) {
		model.addAttribute("page", "calendar/calendar-view");
		
		int totalCount = cs.selectToatalCnt();
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		EmployeeVo loginvo = (EmployeeVo)session.getAttribute("loginVo");
		String no = loginvo.getEmpNo();
		
		//데이터 조회
		List<CalendarVo> cvoList = cs.selectList(pv, loginvo);
		
		
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
	
	
	//중요 일정 등록하기, 해제하기
	@GetMapping("star")
	@ResponseBody
	public String star(String calNo, HttpSession session) {
		
		EmployeeVo loginvo = (EmployeeVo)session.getAttribute("loginVo");
		CalendarVo cv = new CalendarVo();
		
		cv.setCalNo(calNo);
		
		return cs.star(cv);
	}
	
	
	//중요 일정만 조회하기
	@GetMapping("starview/{pno}")
	public String starview (Model model, @PathVariable int pno, HttpServletRequest req, HttpSession session) {
		model.addAttribute("page", "calendar/calendar-starview");
		
		int totalCount = cs.selectToatalCnt();
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		EmployeeVo loginvo = (EmployeeVo)session.getAttribute("loginVo");
		String no = loginvo.getEmpNo();
		
		//데이터 조회
		List<CalendarVo> cvoList = cs.selectStarList(pv, no);
		
		 
		model.addAttribute("cvoList", cvoList);
		model.addAttribute("pv", pv);
		
		return "layout/template"; 
	}
	
	

	
	
	
}
