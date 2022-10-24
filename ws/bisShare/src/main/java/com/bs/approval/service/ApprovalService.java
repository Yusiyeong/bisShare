package com.bs.approval.service;

import java.util.List;

import com.bs.approval.vo.ApprovalVo;

public interface ApprovalService {

	//결재 작성
	int insertOne(ApprovalVo avo);

	
	//결재 목록
	
	//나의 기안서 목록
	List<String> getListByEmpNo(String empNo);

	//기안서 하나 조회
	ApprovalVo getOneByNo(String adcNo);
	
	//임시저장한 기안서
	
}
