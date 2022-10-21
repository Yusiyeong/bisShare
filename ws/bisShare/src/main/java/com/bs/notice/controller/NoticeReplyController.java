package com.bs.notice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.employee.vo.EmployeeVo;
import com.bs.notice.service.NoticeReplyService;
import com.bs.notice.vo.NoticeReplyVo;

@Controller
@RequestMapping("noticeReply")
public class NoticeReplyController {

	private final NoticeReplyService nrs;

	
	// 생성자
	@Autowired
	public NoticeReplyController(NoticeReplyService nrs) {
		super();
		this.nrs = nrs;
	}
	
	// 댓글 작성(화면+진행)
	@PostMapping("write")
	@ResponseBody
	public String write(NoticeReplyVo vo, HttpSession session) {
		
		System.out.println("댓글작성확인vo:::" + vo);
		
		EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
		vo.setWriter(loginVo.getEmpNo());
		
		
		// 서비스 호출
		int result = nrs.write(vo);
		
		if(result == 1) {
			// 성공
			return "ok";
		}else {
			// 실패
			return "fail";
		}
		
	}//write
	
	// 댓글 삭제 
	@GetMapping("delete/{boardNo}")
	public String delete(@PathVariable String boardNo, HttpSession session, Model model) {
		
		// 서비스 호출
		int result = nrs.delete(boardNo);
		
		if(result == 1) {
			//성공
			session.setAttribute("alertMsg", "댓글 삭제 성공!");
			return "redirect:/notice/detail/" + boardNo;
		}else {
			// 실패
			session.setAttribute("alertMsg", "댓글 삭제 실패!");
			return "redirect:/notice/detail/" + boardNo;
		}//if
		
	}//delete
	
	
	
	
	
	
}//class
