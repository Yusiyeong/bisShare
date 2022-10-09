package com.bs.mail.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("mail")
public class MailController {
	
	
	/**
	 * 메일 쓰기 페이지 이동
	 */
	@GetMapping("write")
	public String write(Model model) {
		
		model.addAttribute("title", "WRITE MAIL");
		model.addAttribute("page", "mail/write");
		
		return "layout/template";
	}
	
	/**
	 * 받은 메일함 이동
	 */
	@GetMapping("receive")
	public String received(Model model) {
		
		model.addAttribute("title", "RECEIVED MAIL");
		model.addAttribute("page", "mail/received");
		
		return "layout/template";
	}
	
	/**
	 * 중요 메일함 이동
	 */
	@GetMapping("important")
	public String star(Model model) {
		model.addAttribute("title", "STAR MAIL");
		model.addAttribute("page", "mail/star");
		
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
	
	
}
