package com.bs.mail.service;

import java.util.List;

import com.bs.employee.vo.EmployeeVo;
import com.bs.mail.vo.MailVo;

public interface MailService {

	int write(MailVo mv, List<EmployeeVo> recList, List<EmployeeVo> refList);

	List<MailVo> receive(String empNo);

	String checkStar(String mailNo);

	MailVo detail(String mailNo);

	List<MailVo> star(String empNo);

	String notRead(String empNo);

}
