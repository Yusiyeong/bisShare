package com.bs.approval.vo;

import lombok.Data;

@Data
public class ApprovalVo {
	
	//결재 기본 정보
	private String adcNo;		//결재번호
	private String empNo;		//사원번호 (기안자)
	private String categoryNo;	//결재 카테고리 번호
	private String adcName;		//결재 제목
	private String adcContent;	//결재 내용
	private String enrollDate;	//결재 생성 날짜
	private String cancel;		//취소 여부
	
}
