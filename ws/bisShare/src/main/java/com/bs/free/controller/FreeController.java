package com.bs.free.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.common.PageVo;
import com.bs.common.Pagination;
import com.bs.employee.vo.EmployeeVo;
import com.bs.free.service.FreeReplyService;
import com.bs.free.service.FreeService;
import com.bs.free.vo.FreeReplyVo;
import com.bs.free.vo.FreeVo;

@Controller
@RequestMapping("free")
public class FreeController {

	private final FreeService fs;
	private final FreeReplyService frs;
	
	@Autowired
	public FreeController(FreeService fs, FreeReplyService frs) {
		super();
		this.fs = fs;
		this.frs = frs;
	}


	// 게시글 조회(화면+진행)
	@GetMapping("list/{pno}")
	public String list(@PathVariable int pno, Model model, HttpServletRequest req) {

		 // 데이터 꺼내기(검색)
	      String keyword = req.getParameter("keyword");
	      String condition = req.getParameter("condition");

	      // 데이터 뭉치기(검색)
	      Map<String, String> map = new HashMap<String, String>();
	      map.put("keyword", keyword);
	      map.put("condition", condition);
	      
	      model.addAttribute("keyword", keyword);	// 검색
		  model.addAttribute("condition", condition);	// 검색
			
	      // 페이징 처리 //서비스 호출
	      int totalCount = fs.selectTotalCnt();

	      PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);

	      // 게시글 목록 조회 // 서비스 호출
	      List<FreeVo> voList = fs.selectList(pv, map);
	      model.addAttribute("voList", voList);
	      model.addAttribute("pv", pv);
	      
		model.addAttribute("title", "FREE");
		model.addAttribute("page", "free/list");

		return "layout/template";

	}//list
	

	// 게시글 상세조회(화면+진행) + 댓글 조회
	@GetMapping("detail/{boardNo}")
	public String detail(@PathVariable String boardNo, Model model) {

		FreeVo vo = fs.selectOne(boardNo);
		
		// 댓글 조회
		List<FreeReplyVo> replyList = frs.selectList(boardNo);
		
		model.addAttribute("vo", vo);
	    model.addAttribute("replyList", replyList);
		
		model.addAttribute("title", "POST");
		model.addAttribute("page", "free/detail");

		return "layout/template";
		
	}//detail
	
	// 게시글 삭제
   @GetMapping("delete/{boardNo}")
   public String delete(@PathVariable String boardNo, HttpSession session, Model model) {

      // 서비스 호출
      int result = fs.delete(boardNo);

      if (result == 1) {
         // 성공
         session.setAttribute("alertMsg", "게시글 삭제 성공!");
         return "redirect:/free/list/1";
      } else {
         // 실패
         session.setAttribute("alertMsg", "게시글 삭제 실패!");
         return "redirect:/free/list/" + boardNo;
      } // if

   }// delete
	
    // 게시글 작성(화면)
	@GetMapping("write")
	public String write(Model model) {
		
		model.addAttribute("title", "WRITE");
		model.addAttribute("page", "free/write");

		return "layout/template";

	}//write
	
	// 게시글 작성(진행)
   @PostMapping("write")
   public String write(FreeVo vo, Model model, HttpSession session, HttpServletRequest req) {

      EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
      vo.setWriter(loginVo.getEmpNo());

      // 서비스 호출
      int result = fs.write(vo);
      
      if (result == 1) {
         session.setAttribute("alertMsg", "글 작성 성공!");
         return "redirect:/free/list/1";
      } else {
         model.addAttribute("alertMsg", "글 작성 실패!");
         return "redirect:/free/list/1";
      } // if
      

   }// write

   // 썸머노트 이미지 등록
   @PostMapping("imgUpload")
   @ResponseBody
   public String imgUpload(HttpServletRequest req) throws IOException {
      
      String img = req.getParameter("img").replace("data:image/jpeg;base64,", "");
      byte[] byteImg = Base64.getDecoder().decode(img);
      
      String realPath = req.getServletContext().getRealPath("/resources/upload/board/");
      
      // 변경된 파일명
      long now = System.currentTimeMillis();
      int random = (int)(Math.random() * 90000 + 10000);
      String changeName = now + "_" + random + ".jpg";
      
      String savePath = realPath + changeName;
      
      File f = new File(savePath);
      
      // 아웃풋 스트림(서버에 저장)
      FileOutputStream os = new FileOutputStream(f);
      BufferedOutputStream bos = new BufferedOutputStream(os);
      
      bos.write(byteImg);
      bos.flush();
      bos.close();
      
      savePath = "/test/resources/upload/board/" + changeName;
      return savePath;

   }//imgUpload
   
   // 수정하기(화면)
   @GetMapping("edit/{boardNo}")
   public String edit(@PathVariable String boardNo, Model model) {
	   
	// 서비스 호출
	FreeVo vo = fs.selectOne(boardNo);	// 상세조회 재사용
	
	model.addAttribute("vo", vo);

    model.addAttribute("title", "EDIT");
    model.addAttribute("page", "free/edit");

    return "layout/template";
	   
   }//edit
   
   
   // 수정하기(진행)
   @PostMapping("edit/{boardNo}")
   public String edit(@PathVariable String boardNo, FreeVo vo, HttpSession session, Model model) {
	   
	   vo.setBoardNo(boardNo);
	   
	   // 서비스 호출
	   int result = fs.edit(vo);
	   
	   if (result == 1) {
	         // 성공
	         session.setAttribute("alertMsg", "게시글 수정 성공!");
	         return "redirect:/free/detail/" + boardNo;
	      } else {
	         // 실패
	         session.setAttribute("alertMsg", "게시글 수정 실패!");
	         return "redirect:/free/detail/" + boardNo;
	      } // if
	   
   }//edit
   
	   
}//class
