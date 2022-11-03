package com.bs.mail.vo;

import java.util.List;

import lombok.Data;

@Data
public class MailVo {
	
	private String mailNo;
	private String mailRecNo;
	private String send;
	private String receive;
	private String title;
	private String content;
	private String enrollDate;
	private String status;
	private String star;
	private String reference;
	private String readYn;
	private List<MailAttVo> mavList;
}
