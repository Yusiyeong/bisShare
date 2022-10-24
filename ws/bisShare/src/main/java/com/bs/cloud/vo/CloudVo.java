package com.bs.cloud.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CloudVo {

	private String num; 	// 추가 함 // 로우넘
	private String boardNo;
	private String title;
	private String content;
	private String writer;
	private String cnt;
	private String profilePath; 	// == fileName
	private MultipartFile profile;		// 추가 함
	private String enrollDate;
	private String modifyDate;
	private String status;
	
	
}//class

