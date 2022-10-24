package com.bs.approval.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.approval.vo.ApprovalVo;

public interface ApprovalDao {


	//결재 작성
	int insertDocu(SqlSessionTemplate sst, ApprovalVo avo);		//결재내용(기안자+제목+내용)
	int insertAprver(SqlSessionTemplate sst, Map<String, String> aprvMap);	//결재권자
	int insertAgree(SqlSessionTemplate sst, Map<String, String> agreeMap);	//합의자
	int insertRef(SqlSessionTemplate sst, Map<String, String> refMap);		//참조자
	
	//결재 목록 (내가 결재선, 참조, 합의로 들어가져있는 결재문서)
	
	//나의 기안서 목록 (내가 기안자인 결재문서)
	List<String> getListByNo(SqlSessionTemplate sst, String empNo);
	
	//기안서 하나 조회
	ApprovalVo getOneByNo(SqlSessionTemplate sst, String adcNo);
	
	//임시저장한 기안서
	
}
