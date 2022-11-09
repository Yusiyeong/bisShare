package com.bs.employee.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.common.FileUploader;
import com.bs.employee.service.EmployeeService;
import com.bs.employee.vo.EmployeeVo;
import com.google.gson.Gson;

@Controller
@RequestMapping("employee")
public class EmployeeController {
	
	private final EmployeeService ms;
	
	// 생성자
	@Autowired
	public EmployeeController(EmployeeService ms) {
		this.ms = ms;
	}

	// 로그인
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
		
	}//login
	
	//로그아웃
	@GetMapping("logout")
	public String logout(Model model, HttpSession session) {
		session.removeAttribute("loginVo");
		session.setAttribute("alertMsg","로그아웃성공");
		return "redirect:/";
	}//logout
	
	// 사원등록(진행)
	@PostMapping("enroll")
	public String enroll(EmployeeVo ev, HttpServletRequest req, HttpSession session, Model model) {
		
		if(ev.getProfile() != null && !ev.getProfile().isEmpty()) {
			String savePath = req.getServletContext().getRealPath("/resources/profile/");	
			String changeName = FileUploader.fileUpload(ev.getProfile(), savePath);
			ev.setProfilePath(changeName);
		}
		
		// 이메일
		ev.setEmail(ev.getId() + "@bisshare.com");
		
		// 서비스 호출
		int result = ms.insertMember(ev);
		
		// 화면 선택
		if(result == 1) {
			session.setAttribute("alertMsg", "사원 등록 되었습니다.");
			return "redirect:/admin/list";
		}else {
			model.addAttribute("alertMsg", "사원 등록 실패! 이전 화면으로 돌아갑니다.");
			return "redirect:/admin/list";
		}//if
		
	}//enroll
	
	@GetMapping(value="getList", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getList() {
		
		Gson gson = new Gson();
		
		List<EmployeeVo> list = ms.getList();
		
		String listStr = gson.toJson(list);
		
		return listStr;
	}
	
	// 아이디 중복
	@PostMapping("idDup")
	@ResponseBody
	public String idDup(String memberId) {		
		
		// 서비스 호출
		int result = ms.idDup(memberId);
		return "" + result;		
		
	}//idDup
	
	// 닉네임 중복
	@PostMapping("nickDup")
	@ResponseBody
	public String nickDup(String memberNick) {
		
		// 서비스 호출
		int result = ms.nickDup(memberNick);
		return "" + result;		
				
	}//nickDup
	
	// 퇴직처리
	@PostMapping("quit")
	@ResponseBody
	public String quit(String memberId) {		
		
		// 서비스 호출
		int result = ms.quit(memberId);
		return "" + result;		
		
	}//quit
	
	
}//class






















