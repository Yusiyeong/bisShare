package com.bs.mail.service;

import java.util.List;

import com.bs.mail.vo.MailVo;

public interface MailService {

	int write(MailVo mv);

	List<MailVo> receive(String empNo);

	String checkStar(String mailNo);

	MailVo detail(String mailNo);

}
