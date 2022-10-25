package com.bs.free.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.employee.vo.EmployeeVo;
import com.bs.free.service.FreeReplyService;
import com.bs.free.vo.FreeReplyVo;

@Controller
@RequestMapping("freeReply")
public class FreeReplyController {

	private final FreeReplyService frs;

	@Autowired
	public FreeReplyController(FreeReplyService frs) {
		super();
		this.frs = frs;
	}
	
	// 댓글 작성(화면+진행)
		@PostMapping("write")
		@ResponseBody
		public String write(FreeReplyVo vo, HttpSession session) {
			
			EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
			vo.setWriter(loginVo.getEmpNo());
			
			// 서비스 호출
			int result = frs.write(vo);
			
			System.out.println("write에서 확인::: vo.getReplyNo()::: " + vo.getReplyNo());//ysy
			System.out.println("write_vo::: " + vo);//ysy
			
			if(result == 1) {
				// 성공
				return "ok";
			}else {
				// 실패
				return "fail";
			}
			
		}//write
		
		// 댓글 삭제 
		@PostMapping("delete")
		@ResponseBody
		public String delete(FreeReplyVo vo, HttpSession session) {
			
			EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
			vo.setWriter(loginVo.getEmpNo());
			
			// 서비스 호출
			int result = frs.delete(vo);
			
			System.out.println("delete에서 확인::: vo.getReplyNo()::: " + vo.getReplyNo());//ysy
			System.out.println("delete_vo::: " + vo);//ysy

			
			if(result == 1) {
				//성공
				return "ok";
			}else {
				// 실패
				return "fail";
			}//if
			
		}//delete
		
		// 댓글 수정
		@PostMapping("edit")
		@ResponseBody
		public String edit(FreeReplyVo vo, HttpSession session) {

			EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
			vo.setWriter(loginVo.getEmpNo());
			
			// 서비스 호출
			int result = frs.edit(vo);
			
			System.out.println("edit에서 확인::: vo.getReplyNo()::: " + vo.getReplyNo());//ysy
			System.out.println("edit_vo::: " + vo);//ysy

			if(result == 1) {
				//성공
				return "ok";
			}else {
				// 실패
				return "fail";
			}//if
			
			
		}//edit
	
}//class
