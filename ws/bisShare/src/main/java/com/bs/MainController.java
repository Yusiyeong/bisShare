package com.bs;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bs.approval.service.ApprovalService;
import com.bs.approval.vo.ApprovalVo;
import com.bs.calendar.service.CalendarService;
import com.bs.calendar.vo.CalendarVo;
import com.bs.employee.vo.EmployeeVo;
import com.bs.mail.service.MailService;
import com.bs.mail.vo.MailVo;
import com.bs.notice.service.NoticeService;
import com.bs.notice.vo.NoticeVo;

@Controller
public class MainController {
	
	private final NoticeService ns;
	private final MailService ms;
	private final ApprovalService as;
	private final CalendarService cs;
	
	@Autowired
	public MainController(NoticeService ns, MailService ms, ApprovalService as, CalendarService cs) {
		this.ns = ns;
		this.ms = ms;
		this.as = as;
		this.cs = cs;
	}

	@RequestMapping("/")
	public String loginPage() {
		return "index";
	}
	
	@RequestMapping("/main")
	public String mainPage(Model model, HttpSession session) {
		
		//로그인한 멤버의 정보 (empNo 필요)
		EmployeeVo vo = (EmployeeVo) session.getAttribute("loginVo");
		
		String empNo = vo.getEmpNo();
		
		//공지사항 불러오기
		List<NoticeVo> nvoList = ns.selectList(null, null);
		//메일 불러오기
		List<MailVo> mvoList = ms.unreadMailList(empNo);
		//일정 불러오기 (중요일정)
		List<CalendarVo> cvoList = cs.selectStarList(null, empNo);
		//결재 불러오기
		List<ApprovalVo> avoList = as.getListAuthorMy(empNo);
		if(nvoList!=null) model.addAttribute("nvoList", nvoList);
		if(mvoList!=null) model.addAttribute("mvoList", mvoList);
		if(cvoList!=null) model.addAttribute("cvoList", cvoList);
		if(avoList!=null) model.addAttribute("avoList", avoList);
		
		model.addAttribute("title", "BISSHARE");
		model.addAttribute("page", "layout/main");
		
		return "layout/template";
	}
	
	

	
}
