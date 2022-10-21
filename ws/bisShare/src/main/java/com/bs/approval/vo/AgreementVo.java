package com.bs.approval.vo;

import lombok.Data;

@Data
public class AgreementVo {
	
	//합의자 정보
	private String adcNo;	//결재번호
	private String agreeEmpNo;	//회원번호(결재권자의 회원번호)
	private String agreeNo;	//합의 순번
	private String checkYn;	//확인여부
	
}
