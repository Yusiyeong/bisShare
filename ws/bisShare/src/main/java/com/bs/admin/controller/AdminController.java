package com.bs.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bs.admin.service.AdminService;
import com.bs.employee.vo.EmployeeVo;

@Controller
@RequestMapping("admin")
public class AdminController {

	private final AdminService as;
	
	//생성자
	@Autowired
	public AdminController(AdminService as) {
		super();
		this.as = as;
	}

	
	// 사원 관리 조회(화면+진행) - 전체
	@GetMapping("list")
	public String list(Model model, HttpServletRequest req) {
		
		// 데이터 꺼내기(검색)
		String keyword = req.getParameter("keyword");
		String condition = req.getParameter("condition");
		
		model.addAttribute("keyword", keyword);	// 검색
		model.addAttribute("condition", condition);	// 검색
		
		// 데이터 뭉치기(검색)
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("condition", condition);
				
				
		// 서비스 호출
		List<EmployeeVo> voList = as.entireList(map);
		model.addAttribute("voList", voList);
				
		model.addAttribute("title", "MEMBER LIST");
		model.addAttribute("page", "admin/list");
		 
		return "layout/template";
		
	}//list
	
	// 사원 관리 조회(화면+진행) - 재직
	@GetMapping("inList")
	public String inList(Model model, HttpServletRequest req) {
		
		// 데이터 꺼내기(검색)
		String keyword = req.getParameter("keyword");
		String condition = req.getParameter("condition");
		
		// 데이터 뭉치기(검색)
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("condition", condition);
				
		model.addAttribute("keyword", keyword);	// 검색
		model.addAttribute("condition", condition);	// 검색
		
		// 서비스 호출
		List<EmployeeVo> voList = as.inList(map);
		model.addAttribute("voList", voList);
				
		model.addAttribute("title", "MEMBER LIST");
		model.addAttribute("page", "admin/inList");
		
	    
		return "layout/template";
		
	}//list
	
	// 사원 관리 조회(화면+진행) - 퇴직
	@GetMapping("outList")
	public String outList(Model model, HttpServletRequest req) {
		
		// 데이터 꺼내기(검색)
		String keyword = req.getParameter("keyword");
		String condition = req.getParameter("condition");
		
		// 데이터 뭉치기(검색)
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("condition", condition);
		
		model.addAttribute("keyword", keyword);	// 검색
		model.addAttribute("condition", condition);	// 검색
		
		// 서비스 호출
		List<EmployeeVo> voList = as.outList(map);
		model.addAttribute("voList", voList);
				
		model.addAttribute("title", "MEMBER LIST");
		model.addAttribute("page", "admin/outList");
		
		return "layout/template";
		
	}//list
	

	// 상세조회(사원번호로 조회) - 전체/재직/퇴직
	@GetMapping("detail/{empNo}")
	public String detail(@PathVariable String empNo, Model model) {
		
		// 서비스 호출
		EmployeeVo vo = as.selectOne(empNo);
		model.addAttribute("vo", vo);
		
		model.addAttribute("title", "MEMBER");
		model.addAttribute("page", "admin/detail");

		return "layout/template";
		
	}//detail
	
	
	// 수정하기(진행)
	@PostMapping("detail/{empNo}")
	public String edit(@PathVariable String empNo, EmployeeVo vo, HttpSession session) {
		
		vo.setEmpNo(empNo);
		
		// 서비스 호출
		int result = as.edit(vo);
		
		if(result == 1) {
			// 성공
			session.setAttribute("alertMsg", "수정 성공!");
			return "redirect:/admin/detail/" + empNo;
		}else {
			// 실패
			session.setAttribute("alertMsg", "수정 실패!");
			return "redirect:/admin/detail/" + empNo;
		}//if
				
		
	}//edit
	
	
	// 사원 등록(화면)
	@GetMapping("enroll")
	public String enroll(Model model) {
		
		model.addAttribute("title", "MEMBER ENROLL");
		model.addAttribute("page", "admin/enroll");

		return "layout/template";
		
	}//enroll
	
}//class