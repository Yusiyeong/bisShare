package com.bs.approval.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.approval.service.ApprovalService;
import com.bs.approval.vo.ApprovalVo;
import com.bs.approval.vo.ApproverVo;
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
	public String my(Model model) {
		model.addAttribute("title", "나의 기안서");
		model.addAttribute("page", "approval/my");
		return "layout/template";
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
	
	//결재 작성 진행
	@PostMapping("write")
	@ResponseBody
	public String write(Model model, ApprovalVo aprvVo, ApproverVo aprverVo) {
		
		System.out.println(aprvVo);
		System.out.println(aprverVo);
		
		model.addAttribute("page", "approval/detail");
		return"ok";
	}
	
	//임시저장 화면
	@GetMapping("temp")
	public String temp(Model model) {
		model.addAttribute("title", "임시저장한 기안서");
		model.addAttribute("page", "approval/temp");
		return "layout/template";
	}
	
	//결재함 화면
	@GetMapping("document")
	public String document(Model model) {
		model.addAttribute("title", "나의 결재함");
		model.addAttribute("page", "approval/document");
		return "layout/template";
	}
	
	//결재 디테일 화면
	@GetMapping("Detail")
	public String Detail(Model model) {
		model.addAttribute("title", "결재 서류");
		model.addAttribute("page", "approval/detail");
		return "layout/template";
	}

	
	
	
	
}//class
