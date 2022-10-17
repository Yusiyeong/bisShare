package com.bs.mail.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.employee.vo.EmployeeVo;
import com.bs.mail.service.MailService;
import com.bs.mail.vo.MailVo;
import com.google.gson.Gson;

@Controller
@RequestMapping("mail")
public class MailController {
	
	private final MailService ms;
	
	@Autowired
	public MailController(MailService ms) {
		this.ms = ms;
	}

	/**
	 * 메일 발송
	 */
	public String write(MailVo mv) {
		
		int result = ms.write(mv);
		
		return "";
	}
	
	
	/**
	 * 받은 메일함 이동
	 */
	@GetMapping("receive")
	public String received(Model model, HttpSession session) {
		
		model.addAttribute("title", "RECEIVED MAIL");
		model.addAttribute("page", "mail/received");
		
		EmployeeVo ev = (EmployeeVo) session.getAttribute("loginVo");
		
		String notReadCnt = ms.notRead(ev.getEmpNo());
		
		List<MailVo> list = ms.receive(ev.getEmpNo());
		
		model.addAttribute("notReadCnt",notReadCnt);
		model.addAttribute("receiveMail", list);
		return "layout/template";
	}
	
	/**
	 * 중요 표시
	 */
	@GetMapping("checkStar")
	@ResponseBody
	public String checkStar(String mailNo) {
		
		return ms.checkStar(mailNo);
	}
	
	/**
	 * 중요 메일함 이동
	 */
	@GetMapping("important")
	public String star(Model model, HttpSession session) {
		
		EmployeeVo ev = (EmployeeVo) session.getAttribute("loginVo");
		
		List<MailVo> list = ms.star(ev.getEmpNo());
		
		String notReadCnt = ms.notRead(ev.getEmpNo());
		
		model.addAttribute("notReadCnt",notReadCnt);
		model.addAttribute("receiveMail", list);
		
		model.addAttribute("title", "STAR MAIL");
		model.addAttribute("page", "mail/received");
		
		return "layout/template";
	}
	
	/**
	 * 보낸 메일함 이동
	 */
	@GetMapping("send")
	public String send(Model model) {
		model.addAttribute("title", "SEND MAIL");
		model.addAttribute("page", "mail/send");
		
		return "layout/template";
	}
	
	/**
	 * 상세 보기
	 */
	@GetMapping("detail")
	@ResponseBody
	public String detail(String mailNo) {
		
		Gson gson = new Gson();
		
		MailVo mv = ms.detail(mailNo);
		
		String mvStr = gson.toJson(mv);
		
		return mvStr;
	}
	
	
}
