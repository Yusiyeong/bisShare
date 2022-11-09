package com.bs.approval.service;

import java.util.List;
import java.util.Map;

import com.bs.approval.vo.ApprovalVo;
import com.bs.approval.vo.AprvAttVo;

public interface ApprovalService {

	//결재 작성
	int insertOne(ApprovalVo avo);

	
	//결재 목록
	
	//나의 기안서 목록
	List<ApprovalVo> getListByEmpNo(String empNo);

	//기안서 하나 조회
	ApprovalVo getOneByNo(String adcNo, String empNo);

	//내가 권한있는 기안서 조회(리스트)
	List<ApprovalVo> getListAuthorMy(String empNo);

	//결재권자가 결재 눌렀을때 업데이트
	int updateAprvStatus(ApprovalVo avo, String loginEmpNo, String statusInfo);

	//합의자가 합의 눌렀을때 업데이트
	int updateAgreeStatus(ApprovalVo avo, String loginEmpNo, String statusInfo);

	//기안취소
	int updateCancel(String adcNo);

	//안읽은거 조회
	int countNonRead(String loginEmpNo);


	int insertAprvAtt(String[] fileNames, String adcNo);

	//첨부파일 가져오기
	List<AprvAttVo> getAttList(String adcNo);
	
}
