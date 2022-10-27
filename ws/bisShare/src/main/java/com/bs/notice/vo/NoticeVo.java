package com.bs.notice.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVo {

	private String num; 	// 추가 함 // 로우넘
	private String boardNo;
	private String title;
	private String content;
	private String writer;
	private String cnt;
	private String enrollDate;
	private String modifyDate;
	private String status;
	private int replyCount;	
	
	// 이전글, 다음글
	private String next;
	private String last;
	private String nextTitle;
	private String lastTitle;
	
}//class
