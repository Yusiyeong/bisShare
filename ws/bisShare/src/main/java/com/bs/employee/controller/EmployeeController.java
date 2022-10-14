package com.bs.employee.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bs.employee.service.EmployeeService;
import com.bs.employee.vo.EmployeeVo;

@Controller
@RequestMapping("employee")
public class EmployeeController {
	
	private final EmployeeService ms;
	
	public EmployeeController(EmployeeService ms) {
		this.ms = ms;
	}

	@PostMapping("login")
	public String login(EmployeeVo ev, String rememberCheck, HttpServletResponse resp, HttpSession session) {
		
		if(rememberCheck != null) {
			Cookie c = new Cookie("sid", ev.getId());
			resp.addCookie(c);
		}
		
		EmployeeVo loginVo = ms.login(ev);
		
		if (loginVo != null) {
			session.setAttribute("loginVo", loginVo);
			return "redirect:/main";
		} else {
			session.setAttribute("errorMsg", "아이디 혹은 비밀번호를 확인해주세요");
			return "redirect:/";
		}
		
	}
	
	@PostMapping("join")
	public String join(EmployeeVo ev) {
		
		
		
		return "";
	}
	
}
