package com.bs.approval.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bs.approval.service.ApprovalService;
import com.bs.approval.vo.ApprovalVo;
import com.bs.approval.vo.AprvAttVo;
import com.bs.common.FileUploader;
import com.bs.employee.service.EmployeeService;
import com.bs.employee.vo.EmployeeVo;
import com.bs.mail.vo.MailAttVo;
import com.google.gson.Gson;

@Controller
@RequestMapping("approval")
public class ApprovalController {

	private final EmployeeService empService;
	private final ApprovalService aprvService;
	
	@Autowired
	public ApprovalController(EmployeeService empService, ApprovalService aprvService) {
		this.empService = empService;
		this.aprvService = aprvService;
	}
	
	//나의 기안서 화면
	@GetMapping("my")
	public String my(Model model, HttpSession session) {
		//로그인한 멤버의 정보 (empNo 필요)
		EmployeeVo vo = (EmployeeVo) session.getAttribute("loginVo");
		List<ApprovalVo> aprvList = aprvService.getListByEmpNo(vo.getEmpNo());
		if(aprvList != null) {
			model.addAttribute("aprvList", aprvList);
			model.addAttribute("title", "나의 기안서");
			model.addAttribute("page", "approval/my");
			return "layout/template";
		} else {
			//실패
			return "layout/template";
		}
	}
	

	//결재 작성 화면
	@GetMapping("write")
	public String write(Model model, HttpSession session) {
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		
		//회사 모든 직원 리스트
		List<EmployeeVo> empList = empService.getList();
		//회사 모든 부서 조회
		List<EmployeeVo> deptList = empService.deptList(empVo.getCompanyNo());
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		model.addAttribute("title", "기안서 작성");
		model.addAttribute("page", "approval/approval-write");
		return "layout/template";
	}
	
	//결재 작성 진행 (ajax)
	@PostMapping("write")
	@ResponseBody
	public String write(Model model, ApprovalVo avo, HttpSession session) {
		//회원번호 담아주기
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		avo.setEmpNo(empVo.getEmpNo());
		
		int result = aprvService.insertOne(avo);
		
		if(result == 1) {
			model.addAttribute("page", "approval/detail");
			return avo.getAdcNo();
		} else {
			//작성실패
			return null;
		}
	}
	
	//파일 업로드 화면 ajax
	@PostMapping(value = "fileUpload", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String fileUpload(@RequestParam(value = "files", required = false) MultipartFile[] files, HttpServletRequest req) {
		Gson gson = new Gson();
		String savePath = req.getServletContext().getRealPath("/resources/upload/approve/");
		List<Map<String, String>> nameList = new ArrayList<Map<String,String>>();
		
		if(files != null) {	
			for(MultipartFile f : files) {
				String originName = f.getOriginalFilename();
				String name = FileUploader.fileUploadWithChangName(f, savePath);
				Map<String, String> fileNames = new HashMap<String, String>();
				fileNames.put("originName", originName);
				fileNames.put("name", name);
				nameList.add(fileNames);
			}
		}
		
		return gson.toJson(nameList);
	}
	
	//업로드할 파일 클릭시 삭제 하는 ajax
	@PostMapping(value = "delFile", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String fileDelete(String fileName, HttpServletRequest req) {
		String savePath = req.getServletContext().getRealPath("/resources/upload/mail/");
		File file = new File(savePath+fileName);
		
		boolean result = file.delete();
		if(result) {			
			return "성공";
		}else {
			return "실패";
		}
		
	}
	
	//결재 작성 파일첨부 -> DB에 저장하는 (ajax)
	@PostMapping("attach")
	@ResponseBody
	public String attach(Model model,@RequestParam(value="fileNames[]") String[] fileNames, String adcNo) {
		//첨부된 파일 있을 경우에만 진행
		if(fileNames != null) {
			int result = aprvService.insertAprvAtt(fileNames, adcNo);
			if(result == fileNames.length) return adcNo;
			else return null;
		} else {
			return "첨부된 파일이 없음";
		}
		
	}
	
	//결재함 화면 (내가 결재권자 || 합의 || 참조)
	@GetMapping("document")
	public String document(Model model, HttpSession session) {
		
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		List<ApprovalVo> myAuthoAprvList = new ArrayList<>();
		if(empVo != null) {
			myAuthoAprvList = aprvService.getListAuthorMy(empVo.getEmpNo());
			model.addAttribute("aprvList", myAuthoAprvList);
			model.addAttribute("title", "나의 결재함");
			model.addAttribute("page", "approval/document");
			return "layout/template";
		}
		else {
			return "main";
		}
		
	}
	
	//결재 디테일 화면
	@GetMapping("detail/{adcNo}")
	public String Detail(Model model, @PathVariable String adcNo, HttpSession session) {
		
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		
		ApprovalVo vo = aprvService.getOneByNo(adcNo, empVo.getEmpNo());
		List<AprvAttVo> attVoList = aprvService.getAttList(adcNo);
		
		if(attVoList != null) model.addAttribute("attList", attVoList); //첨부파일 있을때만
		else model.addAttribute("attList", null);
		
		model.addAttribute("avo", vo);
		model.addAttribute("title", "결재 서류");
		model.addAttribute("page", "approval/detail");
		return "layout/template";
	}

	//결재 버튼 눌렀을때 ajax
	@PostMapping("approve")
	@ResponseBody
	public String approve(ApprovalVo avo, HttpSession session) {
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		
		String loginEmpNo = empVo.getEmpNo();
		String statusInfo = "Y";
		int result = aprvService.updateAprvStatus(avo, loginEmpNo, statusInfo);
		
		if(result==1) {
			return "ok";
		} else {
			return "fail";
		}
	}
	
	//합의 버튼 눌렀을때 ajax
	@PostMapping("agree")
	@ResponseBody
	public String agree(ApprovalVo avo, HttpSession session) {
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		
		String loginEmpNo = empVo.getEmpNo();
		String statusInfo = "Y";
		int result = aprvService.updateAgreeStatus(avo, loginEmpNo, statusInfo);
		
		if(result==1) {
			return "ok";
		} else {
			return "fail";
		}
	}
	
	//기안 취소
	@PostMapping("cancel")
	@ResponseBody
	public String cancel(String adcNo) {
		int result = aprvService.updateCancel(adcNo);
		if(result==1) return"ok";
		else return"false";
	}
	
	//결재 반려 버튼 눌렀을때 ajax
	@PostMapping("approveReject")
	@ResponseBody
	public String approveReject(ApprovalVo avo, HttpSession session) {
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		
		String loginEmpNo = empVo.getEmpNo();
		String statusInfo = "R";
		int result = aprvService.updateAprvStatus(avo, loginEmpNo, statusInfo);
		
		if(result==1) {
			return "ok";
		} else {
			return "fail";
		}
	}
	
	//합의 반려 버튼 눌렀을때 ajax
	@PostMapping("agreeReject")
	@ResponseBody
	public String agreeReject(ApprovalVo avo, HttpSession session) {
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		
		String loginEmpNo = empVo.getEmpNo();
		String statusInfo = "R";
		int result = aprvService.updateAgreeStatus(avo, loginEmpNo, statusInfo);
		
		if(result==1) {
			return "ok";
		} else {
			return "fail";
		}
	}
	
	// 사이드바에 표시해줄 안읽은 결재문서 ajax
	@PostMapping("nonReadCount")
	@ResponseBody
	public String nonReadCount(HttpSession session) {
		EmployeeVo empVo = (EmployeeVo) session.getAttribute("loginVo");
		
		String loginEmpNo = empVo.getEmpNo();
		int result = aprvService.countNonRead(loginEmpNo);
		
		if(result==1) {
			return "ok";
		} else {
			return "fail";
		}
	}
	
	//첨부파일 다운로드
	@GetMapping("download/{name}/{origin}")
	public ResponseEntity<ByteArrayResource> download(@PathVariable String name,@PathVariable String origin, HttpServletRequest req) throws IOException {
		String fileName = URLEncoder.encode(origin, "UTF-8");
		fileName = "\'" + fileName + "\'";
		
		String path = req.getServletContext().getRealPath("/resources/upload/approve/");
		
		File file = new File(path + name);
		
		Path filePath = Paths.get(path+name);
		
		byte[] data = FileUtils.readFileToByteArray(file);
		ByteArrayResource res = new ByteArrayResource(data);
		
		return ResponseEntity
				.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(Files.size(filePath))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + URLEncoder.encode(origin, "UTF-8"))
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.body(res);
	}
	
	
}//class
























