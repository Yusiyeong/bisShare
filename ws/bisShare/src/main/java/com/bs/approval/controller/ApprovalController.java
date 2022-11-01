package com.bs.approval.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.approval.service.ApprovalService;
import com.bs.approval.vo.ApprovalVo;
import com.bs.employee.service.EmployeeService;
import com.bs.employee.vo.EmployeeVo;

@Controller
@RequestMapping("approval")
public class ApprovalController {

	private final EmployeeService empService;
	private final ApprovalService aprvService;
	
	@Autowired
	public ApprovalController(EmployeeService empService, ApprovalService aprvService) {
		this.empService = empService;
		this.aprvService = aprvService;
	}
	
	//나의 기안서 화면
	@GetMapping("my")
	public String my(Model model, HttpSession session) {
		//로그인한 멤버의 정보 (empNo 필요)
		EmployeeVo vo = (EmployeeVo) session.getAttribute("loginVo");
		List<ApprovalVo> aprvList = aprvService.getListByEmpNo(vo.getEmpNo());
		
		if(aprvList != null) {
			model.addAttribute("aprvList", aprvList);
			model.addAttribute("title", "나의 기안서");
			model.addAttribute("page", "approval/my");
			return "layout/template";
		} else {
			//실패
			return "";
		}
	}
	

	//결재 작성 화면
	@GetMapping("write")
	public String write(Model model) {
		
		List<EmployeeVo> empList = empService.getList();
		
		model.addAttribute("empList", empList);
		model.addAttribute("title", "기안서 작성");
		model.addAttribute("page", "approval/approval-write");
		return "layout/template";
	}
	
	//결재 작성 진행 (ajax)
	@PostMapping("write")
	@ResponseBody
	public String write(Model model, ApprovalVo avo, HttpSession session) {
		//회원번호 담아주기
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		avo.setEmpNo(empVo.getEmpNo());
		
		int result = aprvService.insertOne(avo);
		
		if(result == 1) {
			model.addAttribute("page", "approval/detail");
			return avo.getAdcNo();
		} else {
			//작성실패
			return null;
		}
	}
	
	//임시저장 화면
	@GetMapping("temp")
	public String temp(Model model) {
		model.addAttribute("title", "임시저장한 기안서");
		model.addAttribute("page", "approval/temp");
		return "layout/template";
	}
	
	//결재함 화면 (내가 결재권자 || 합의 || 참조)
	@GetMapping("document")
	public String document(Model model, HttpSession session) {
		
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		
		List<ApprovalVo> myAuthoAprvList = aprvService.getListAuthorMy(empVo.getEmpNo());
		
		model.addAttribute("aprvList", myAuthoAprvList);
		model.addAttribute("title", "나의 결재함");
		model.addAttribute("page", "approval/document");
		return "layout/template";
	}
	
	//결재 디테일 화면
	@GetMapping("detail/{adcNo}")
	public String Detail(Model model, @PathVariable String adcNo, HttpSession session) {
		
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		
		ApprovalVo vo = aprvService.getOneByNo(adcNo, empVo.getEmpNo());
		
		System.out.println(vo);
		model.addAttribute("avo", vo);
		model.addAttribute("title", "결재 서류");
		model.addAttribute("page", "approval/detail");
		return "layout/template";
	}

	//결재 버튼 눌렀을때 ajax
	@PostMapping("approve")
	@ResponseBody
	public String approve(ApprovalVo avo, HttpSession session) {
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		
		String loginEmpNo = empVo.getEmpNo();
		int result = aprvService.updateAprvStatus(avo, loginEmpNo);
		
		if(result==1) {
			return "ok";
		} else {
			return "fail";
		}
	}
	
	//합의 버튼 눌렀을때 ajax
	@PostMapping("agree")
	@ResponseBody
	public String agree(ApprovalVo avo, HttpSession session) {
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		
		String loginEmpNo = empVo.getEmpNo();
		int result = aprvService.updateAgreeStatus(avo, loginEmpNo);
		
		if(result==1) {
			return "ok";
		} else {
			return "fail";
		}
	}
	
	
	
}//class
