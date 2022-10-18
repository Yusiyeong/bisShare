package com.bs.mail.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.Base64;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.employee.vo.EmployeeVo;
import com.bs.mail.service.MailService;
import com.bs.mail.vo.MailVo;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

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
	@PostMapping("write")
	public String write(MailVo mv) {
		
		Gson gson = new Gson();
		
		String receive = mv.getReceive();
		String reference = mv.getReference();
		List<EmployeeVo> recList = gson.fromJson(receive, new TypeToken<List<EmployeeVo>>() {}.getType()); 
		List<EmployeeVo> refList = gson.fromJson(reference, new TypeToken<List<EmployeeVo>>() {}.getType());
		
		int result = ms.write(mv,recList,refList);
		if (result==1) {
			
			
			
			return "";
		} else {
			return "";
		}
		
		
		
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
	
	@PostMapping("imgUpload")
	@ResponseBody
	public String imgUpload(String img, HttpServletRequest req) {
		
		String img1 = img.replace("data:image/jpeg;base64,", "");
		
		byte[] byteImg = Base64.getDecoder().decode(img1);
		
		String realPath = req.getServletContext().getRealPath("/resources/upload/mail/");
		String fileName = UUID.randomUUID().toString() + ".jpg";
		
		String savePath = realPath + fileName;
		
		System.out.println(savePath);
		
		
		File f = new File(savePath);
		FileOutputStream fos;
		try {
			fos = new FileOutputStream(f);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			bos.write(byteImg);
			
			bos.flush();
			bos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		savePath = "/test/resources/upload/mail/" + fileName;
		
		return savePath;
	}
	
	
}
