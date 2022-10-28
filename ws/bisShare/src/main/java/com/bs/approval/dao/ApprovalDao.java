package com.bs.approval.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.approval.vo.ApprovalVo;

public interface ApprovalDao {


	//결재 작성
	int insertDocu(SqlSessionTemplate sst, ApprovalVo avo);		//결재내용(기안자+제목+내용)
	
	//결재 목록 (내가 결재선, 참조, 합의로 들어가져있는 결재문서)
	
	//나의 기안서 목록 (내가 기안자인 결재문서)
	List<ApprovalVo> getListByNo(SqlSessionTemplate sst, String empNo);
	
	//기안서 하나 조회
	ApprovalVo getOneByNo(SqlSessionTemplate sst, String adcNo);

	//기안서 전체 조회
	List<ApprovalVo> getListAll(SqlSessionTemplate sst);

	//결재권자가 입력한 결재 업데이트 하기
	int updateAprvStatus(SqlSessionTemplate sst, ApprovalVo avo);
	
	//임시저장한 기안서
	
}
