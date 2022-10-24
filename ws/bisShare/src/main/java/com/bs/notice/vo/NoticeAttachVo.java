package com.bs.notice.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeAttachVo {

	private String attNo;
	private String bno;
	private String originName;
	private String name;
	private String path;
	private String enrollDate;
	
}//class
