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

	int delChecked(List<String> checkArr, EmployeeVo loginVo, int filter);

	List<MailVo> reference(String empNo);

	MailVo detailRef(MailVo vo);

	List<MailVo> send(String empNo);

	MailVo detailSend(MailVo vo);

	List<MailVo> trashcan(String empNo);

	List<MailVo> detailTrash(MailVo vo);

	List<MailVo> draft(String empNo);

	int draftWrite(MailVo mv, List<EmployeeVo> recList, List<EmployeeVo> refList);

	MailVo draftDetail(String mailNo);

	int delCheckedDraft(List<String> checkArr, EmployeeVo loginVo);

	void insertDraftAtt(MailAttVo mav);

	List<MailVo> unreadMailList(String empNo);
}
