package com.bs.mail.service;

import java.util.List;

import com.bs.employee.vo.EmployeeVo;
import com.bs.mail.vo.MailAttVo;
import com.bs.mail.vo.MailVo;

public interface MailService {

	int write(MailVo mv, List<EmployeeVo> recList, List<EmployeeVo> refList);

	List<MailVo> receive(String empNo);

	String checkStar(MailVo mv);

	MailVo detail(MailVo mv);

	List<MailVo> star(String empNo);

	String notRead(String empNo);

	void insertMailAtt(MailAttVo mav);

	int delChecked(List<String> checkArr);

	List<MailVo> reference(String empNo);

	MailVo detailRef(MailVo vo);

}
