package com.bs.approval.vo;

import lombok.Data;

@Data
public class ApproverVo {

	//결재권자 정보
	private String adcNo;	//결재번호
	private String empNo;	//회원번호(결재권자의 회원번호)
	private String aprvNo;	//결재 순번
	private String aprvYn;	//승인여부
	
}
