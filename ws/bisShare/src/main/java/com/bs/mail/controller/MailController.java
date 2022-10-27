package com.bs.mail.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bs.common.FileUploader;
import com.bs.employee.vo.EmployeeVo;
import com.bs.mail.service.MailService;
import com.bs.mail.vo.MailAttVo;
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
	public String write(MailVo mv, HttpSession session, MultipartHttpServletRequest mhreq, HttpServletRequest req) {
		
		Gson gson = new Gson();
		
		EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
		mv.setSend(loginVo.getEmpNo());
		
		
		String receive = mv.getReceive();
		String reference = mv.getReference();
		List<EmployeeVo> recList = gson.fromJson(receive, new TypeToken<List<EmployeeVo>>() {
		}.getType());
		List<EmployeeVo> refList = gson.fromJson(reference, new TypeToken<List<EmployeeVo>>() {
		}.getType());

		int result = ms.write(mv, recList, refList);

		List<MultipartFile> fileList = mhreq.getFiles("file");
		MailAttVo mav = new MailAttVo();
		for (MultipartFile f : fileList) {
			if (!f.isEmpty()) {

				String origin = f.getOriginalFilename();
				String path = req.getServletContext().getRealPath("/resources/upload/mail/");
				String change = FileUploader.fileUpload(f, path);

				try {
					f.transferTo(new File(path + change));
				} catch (Exception e) {
					e.printStackTrace();
				}
				mav.setOriginName(origin);
				mav.setName(change);
				
				ms.insertMailAtt(mav);
			}
		}
		
		if (result == 1) {
			return "redirect:/mail/receive";
		} else {
			session.setAttribute("errorMsg", "발송 실패!");
			return "redirect:/";
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

		model.addAttribute("notReadCnt", notReadCnt);
		model.addAttribute("receiveMail", list);
		return "layout/template";
	}

	/**
	 * 중요 표시
	 */
	@GetMapping("checkStar/{filter}")
	@ResponseBody
	public String checkStar(String mailNo,HttpSession session, @PathVariable int filter) {
		EmployeeVo ev = (EmployeeVo) session.getAttribute("loginVo");
		MailVo mv = new MailVo();
		
		if (filter == 0) {
			mv.setMailNo(mailNo);
			mv.setReceive(ev.getEmpNo());
			ms.checkStar(mv);
		} else if (filter == 1) {
			mv.setMailNo(mailNo);
			mv.setReference(ev.getEmpNo());
			ms.checkStar(mv);
		}
		
		
		return null;
	}

	/**
	 * 중요 메일함 이동
	 */
	@GetMapping("important")
	public String star(Model model, HttpSession session) {

		EmployeeVo ev = (EmployeeVo) session.getAttribute("loginVo");

		List<MailVo> list = ms.star(ev.getEmpNo());
		String notReadCnt = ms.notRead(ev.getEmpNo());

		model.addAttribute("notReadCnt", notReadCnt);
		model.addAttribute("receiveMail", list);

		model.addAttribute("title", "STAR MAIL");
		model.addAttribute("page", "mail/received");

		return "layout/template";
	}

	/**
	 * 보낸 메일함 이동
	 */
	@GetMapping("send")
	public String send(Model model, HttpSession session) {
		
		EmployeeVo ev = (EmployeeVo) session.getAttribute("loginVo");

		List<MailVo> list = ms.send(ev.getEmpNo());
		String notReadCnt = ms.notRead(ev.getEmpNo());

		model.addAttribute("notReadCnt", notReadCnt);
		model.addAttribute("receiveMail", list);

		model.addAttribute("title", "SEND MAIL");
		model.addAttribute("page", "mail/received");
		return "layout/template";
	}

	/**
	 * 상세 보기
	 */
	@PostMapping("detail/{filter}")
	@ResponseBody
	public String detail(MailVo mailInfo, HttpSession session, @PathVariable int filter) {
		Gson gson = new Gson();

		MailVo vo = new MailVo();

		EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
		String empNo = loginVo.getEmpNo();
		MailVo mv = null;
		if(filter==0) {
//			받은 메일 조회
			vo.setReceive(empNo);
			vo.setMailNo(mailInfo.getMailNo());
			mv = ms.detail(vo);
		}else if(filter == 1){
//			참조된 메일 조회
			vo.setReference(empNo);
			vo.setMailNo(mailInfo.getMailNo());
			mv = ms.detailRef(vo);
		} else if (filter == 2) {
//			보낸 메일 조회
			vo.setSend(empNo);
			vo.setMailNo(mailInfo.getMailNo());
			mv = ms.detailSend(vo);
		} else if (filter == 3) {
//			휴지통
			vo.setReceive(empNo);
			vo.setMailNo(mailInfo.getMailNo());
			List<MailVo> list = ms.detailTrash(vo);
			String listStr = gson.toJson(list);
			return listStr;
		}
		
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
	
	/**
	 * 첨부파일 다운로드
	 */
	@GetMapping("download/{name}/{origin}")
	public ResponseEntity<ByteArrayResource> download(@PathVariable String name,@PathVariable String origin, HttpServletRequest req) throws IOException {
		String fileName = URLEncoder.encode(origin, "UTF-8");
		fileName = "\'" + fileName + "\'";
		
		String path = req.getServletContext().getRealPath("/resources/upload/mail/");
		
		File file = new File(path + name);
		
		Path filePath = Paths.get(path+name);
		
		byte[] data = FileUtils.readFileToByteArray(file);
		ByteArrayResource res = new ByteArrayResource(data);
		
		return ResponseEntity
				.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(Files.size(filePath))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + origin)
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.body(res);
	}
	
	/*
	 * 체크된 메일 삭제
	 */
	@GetMapping("delChecked/{filter}")
	@ResponseBody
	public int delChecked(@RequestParam(value="checkArr[]") List<String> checkArr, @PathVariable int filter, HttpSession session) {
		
		EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
		int result = ms.delChecked(checkArr, loginVo, filter);
		
		return result;
	}
	
	/**
	 * 참조된 메일
	 */
	@GetMapping("reference")
	public String reference(Model model, HttpSession session) {
		
		EmployeeVo ev = (EmployeeVo) session.getAttribute("loginVo");

		List<MailVo> list = ms.reference(ev.getEmpNo());
		String notReadCnt = ms.notRead(ev.getEmpNo());

		model.addAttribute("notReadCnt", notReadCnt);
		model.addAttribute("receiveMail", list);

		model.addAttribute("title", "REFERENCE MAIL");
		model.addAttribute("page", "mail/received");

		return "layout/template";
	}
	
	/**
	 * 안읽은 메일 수 업데이트
	 */
	@GetMapping("updateCnt")
	@ResponseBody
	public String updateCnt(HttpSession session) {
		EmployeeVo ev = (EmployeeVo) session.getAttribute("loginVo");
		return ms.notRead(ev.getEmpNo());
	}
	
	/**
	 * 휴지통
	 */
	@GetMapping("trashcan")
	public String trashcan(Model model, HttpSession session) {
		
		EmployeeVo ev = (EmployeeVo) session.getAttribute("loginVo");

		List<MailVo> list = ms.trashcan(ev.getEmpNo());
		String notReadCnt = ms.notRead(ev.getEmpNo());

		model.addAttribute("notReadCnt", notReadCnt);
		model.addAttribute("receiveMail", list);

		model.addAttribute("title", "REFERENCE MAIL");
		model.addAttribute("page", "mail/received");

		return "layout/template";
	}
}
