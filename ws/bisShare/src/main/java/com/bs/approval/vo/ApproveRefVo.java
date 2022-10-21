package com.bs.approval.vo;

import lombok.Data;

@Data
public class ApproveRefVo {
	
	//합의자 정보
	private String adcNo;	//결재번호
	private String refEmpNo;	//회원번호(결재권자의 회원번호)
	private String refNo;	//참조 순번
	private String checkYn;	//확인여부
	
}
