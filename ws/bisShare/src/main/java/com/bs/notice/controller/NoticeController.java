package com.bs.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bs.common.PageVo;
import com.bs.common.Pagination;
import com.bs.notice.service.NoticeService;
import com.bs.notice.vo.NoticeVo;

@Controller
@RequestMapping("notice")
public class NoticeController {

	private final NoticeService bs;
	
	// 생성자
	@Autowired
	public NoticeController(NoticeService bs) {
		super();
		this.bs = bs;
	}


	// 게시글 작성(화면)
	@GetMapping("write")
	public String write(Model model) {
		
		model.addAttribute("title", "WRITE");
		model.addAttribute("page", "notice/write");
		
		return "layout/template";
		
	}//write
	
	// 게시글 목록 조회(화면+진행)
	@GetMapping("list/{pno}")
	public String list(Model model, @PathVariable int pno, HttpServletRequest req) {

		// 데이터 꺼내기(검색)
		String keyword = req.getParameter("keyword");
		String condition = req.getParameter("condition");
		
		// 데이터 뭉치기(검색)
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("condition", condition);
				
		
		// 페이징 처리 //서비스 호출
		int totalCount = bs.selectTotalCnt();
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		// 서비스 호출
		List<NoticeVo> voList = bs.selectList(pv, map);
		model.addAttribute("voList", voList);
		model.addAttribute("pv", pv);
		
		model.addAttribute("title", "NOTICE");
		model.addAttribute("page", "notice/list");

		return "layout/template";

	}//list
	

	// 게시글 상세조회(화면)
	@GetMapping("detail")
	public String detail(Model model) {

		model.addAttribute("title", "POST");
		model.addAttribute("page", "notice/detail");

		return "layout/template";
		
	}//detail
		
		
}//class
