package com.bs.cloud.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.cloud.service.CloudService;
import com.bs.cloud.vo.CloudVo;
import com.bs.common.FileUploader;
import com.bs.common.PageVo;
import com.bs.common.Pagination;
import com.bs.employee.vo.EmployeeVo;

@Controller
@RequestMapping("cloud")
public class CloudController {

	private final CloudService cs;
	
	// 생성자
	@Autowired
	public CloudController(CloudService cs) {
		super();
		this.cs = cs;
	}


	// 게시글 목록 조회(화면+진행)
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
	      int totalCount = cs.selectTotalCnt();
	      PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);

	      // 게시글 목록 조회 // 서비스 호출
	      List<CloudVo> voList = cs.selectList(pv, map);
	      model.addAttribute("voList", voList);
	      model.addAttribute("pv", pv);
	      
		model.addAttribute("title", "CLOUD");
		model.addAttribute("page", "cloud/list");

		return "layout/template";
		
	}//list
	
	
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
	   
	   
	// 게시글 작성(화면)
	@GetMapping("write")
	public String write(Model model) {
		
		 model.addAttribute("title", "WRITE");
	     model.addAttribute("page", "cloud/write");

	      return "layout/template";
	      
	}//write
	
	
	// 게시글 작성(진행) + 파일 업로드
	@PostMapping("write")
	public String write(CloudVo vo, HttpServletRequest req, HttpSession session, Model model) {
		
        EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
        vo.setWriter(loginVo.getEmpNo());

        // 파일 업로드 
		if(vo.getProfile() != null && !vo.getProfile().isEmpty()) {
			String savePath = req.getServletContext().getRealPath("/resources/upload/board/");	
			String changeName = FileUploader.fileUpload(vo.getProfile(), savePath);
			vo.setProfilePath(changeName);
		}
		
		// 서비스 호출
		int result = cs.write(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "파일 업로드 성공!");
			return "redirect:/cloud/list/1";
		}else {
			model.addAttribute("alertMsg", "파일 업로드 실패!");
			return "redirect:/cloud/list/1";
		}//if
		
		
	}//write
	
	
	// 게시글 상세조회(화면+진행)
	@GetMapping("detail/{boardNo}")
	public String detail(@PathVariable String boardNo, Model model) {
		
		// 서비스 호출
		CloudVo vo = cs.selectOne(boardNo);
		
		System.out.println("CloudVo::: " + vo);
		
	    model.addAttribute("vo", vo);

	    model.addAttribute("title", "POST");
        model.addAttribute("page", "cloud/detail");

        return "layout/template";
		
	}//detail

	// 파일 다운
	@GetMapping("download/{profilePath}")
	public ResponseEntity<ByteArrayResource> download(@PathVariable String profilePath, HttpServletRequest req) throws IOException {

		String fileName = URLEncoder.encode(profilePath, "UTF-8");
		fileName = "\"" + fileName + "\"";
		
		//파일 객체 준비
		String rootPath = req.getServletContext().getRealPath("/resources/upload/board/");
		File target = new File(rootPath + profilePath);
		
		Path filePath = Paths.get(rootPath + profilePath);
		
		//파일 -> 바이트 -> 리소스
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource res = new ByteArrayResource(data);
		
		return ResponseEntity
			.ok()
			.contentType(MediaType.APPLICATION_OCTET_STREAM)
			.contentLength(Files.size(filePath))
			.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + fileName)
			.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
			.body(res);
		
		
	}//download
	
	
	// 게시글 수정(화면)
	@GetMapping("edit/{boardNo}")
	public String edit(@PathVariable String boardNo, Model model) {
		
		// 서비스 호출
		CloudVo vo = cs.selectOne(boardNo);		// 상세조회 재사용

		model.addAttribute("vo", vo);

		model.addAttribute("title", "EDIT");
	    model.addAttribute("page", "cloud/edit");

	    return "layout/template";
	}//edit
	
	
	// 게시글 수정(진행) + 파일 업로드
	@PostMapping("edit/{boardNo}")
	public String edit(@PathVariable String boardNo, CloudVo vo, HttpServletRequest req, HttpSession session, Model model) {
		
//		EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
//        vo.setWriter(loginVo.getEmpNo());

        // 파일 업로드 
		if(vo.getProfile() != null && !vo.getProfile().isEmpty()) {
			String savePath = req.getServletContext().getRealPath("/resources/upload/board/");	
			String changeName = FileUploader.fileUpload(vo.getProfile(), savePath);
			vo.setProfilePath(changeName);
		}
			
//		-----------------------------------------------
			
		vo.setBoardNo(boardNo);
		
		// 서비스 호출
		int result = cs.edit(vo);
		
		if (result == 1) {
	         // 성공
	         session.setAttribute("alertMsg", "게시글 수정 성공!");
	         return "redirect:/cloud/detail/" + boardNo;
	      } else {
	         // 실패
	         session.setAttribute("alertMsg", "게시글 수정 실패!");
	         return "redirect:/cloud/detail/" + boardNo;
	      } // if
		
		
	}//edit
	
	
	// 게시글 삭제하기
	@GetMapping("delete/{boardNo}")
	public String delete(@PathVariable String boardNo, HttpSession session, Model model) {
		
		 // 서비스 호출
	      int result = cs.delete(boardNo);

	      if (result == 1) {
	         // 성공
	         session.setAttribute("alertMsg", "게시글 삭제 성공!");
	         return "redirect:/cloud/list/1";
	      } else {
	         // 실패
	         session.setAttribute("alertMsg", "게시글 삭제 실패!");
	         return "redirect:/cloud/list/" + boardNo;
	      } // if
	      
	}//delete
	
	
	
}//class 
