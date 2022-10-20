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
import com.bs.notice.service.NoticeReplyService;
import com.bs.notice.service.NoticeService;
import com.bs.notice.vo.NoticeReplyVo;
import com.bs.notice.vo.NoticeVo;

@Controller
@RequestMapping("notice")
public class NoticeController {

	private final NoticeService ns;
	private final NoticeReplyService nrs;		// 댓글
	
	// 생성자
	@Autowired
	public NoticeController(NoticeService ns, NoticeReplyService nrs) {
		super();
		this.ns = ns;
		this.nrs = nrs;
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
		int totalCount = ns.selectTotalCnt();
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		// 서비스 호출
		List<NoticeVo> voList = ns.selectList(pv, map);
		model.addAttribute("voList", voList);
		model.addAttribute("pv", pv);
		
		model.addAttribute("title", "NOTICE");
		model.addAttribute("page", "notice/list");

		return "layout/template";

	}//list
	

	// 게시글 상세조회(화면+진행) + 댓글 조회
	@GetMapping("detail/{boardNo}")
	public String detail(@PathVariable String boardNo, Model model) {

		NoticeVo vo = ns.selectOne(boardNo);
		
		List<NoticeReplyVo> replyList = nrs.selectList(boardNo);	// 댓글 조회
		
		System.out.println("replyList::::" + replyList );
		
		model.addAttribute("vo", vo);
		model.addAttribute("replyList", replyList);

		model.addAttribute("title", "POST");
		model.addAttribute("page", "notice/detail");

		return "layout/template";
		
	}//detail
		
		
}//class
