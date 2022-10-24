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
	
	//결재권자 정보
	private String[] aprvEmpNo;	//회원번호(결재권자의 회원번호)
	private String[] aprvNo;	//결재 순번
	private String[] aprvYn;	//승인여부
	
	//합의자 정보
	private String[] agreeEmpNo;//회원번호(결재권자의 회원번호)
	private String[] agreeNo;	//합의 순번
	private String[] agreeYn;	//확인여부
	
	//참조자 정보
	private String[] refEmpNo;	//회원번호(결재권자의 회원번호)
	private String[] refNo;		//참조 순번
	private String[] checkYn;	//확인여부
	
	
	
}
