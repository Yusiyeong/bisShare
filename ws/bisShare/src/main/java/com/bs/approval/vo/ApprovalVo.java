package com.bs.approval.vo;

import lombok.Data;

@Data
public class ApprovalVo {
	
	//결재 기본 정보
	private String adcNo;
	private String empNo;
	private String categoryNo;
	private String adcName;
	private String adcContent;
	private String enrollDate;
	//결재권자
	private String aprverEmpNo;
	private String aprverStatus;
	//합의자
	private String agreeEmpNo;
	private String agreeStatus;
	//참조자
	private String refEmpNo;
	private String refStatus;
	//취소여부
	private String cancel;
	
	
	
}
