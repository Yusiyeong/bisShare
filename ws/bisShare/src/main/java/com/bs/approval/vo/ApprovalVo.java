package com.bs.approval.vo;

import java.util.List;

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
	private String[] aprverEmpNos;
	private String aprverStatus;
	private String[] aprverStatuses;
	private String[] aprverNicks;
	private String[] aprverRanks;
	private String[] aprverDepts;
	//합의자
	private String agreeEmpNo;
	private String agreeStatus;
	private String[] agreeEmpNos;
	private String[] agreeStatuses;
	private String[] agreeNicks;
	//참조자
	private String refEmpNo;
	private String refStatus;
	private String[] refEmpNos;
	private String[] refStatuses;
	private String[] refNicks;
	//취소여부
	private String cancel;
	
	//나의 권한
	private String myAutho;
	
	//진행도
	private String progress;
}


















