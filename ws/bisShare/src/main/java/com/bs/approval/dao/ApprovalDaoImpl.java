package com.bs.approval.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.approval.vo.ApprovalVo;
import com.bs.approval.vo.AprvAttVo;

@Repository
public class ApprovalDaoImpl implements ApprovalDao{

	//결재 테이블 작성
	@Override
	public int insertDocu(SqlSessionTemplate sst, ApprovalVo avo) {
		return sst.insert("approvalMapper.insertOneIntoDocu", avo);
	}
	
	//내가 작성한 기안서
	@Override
	public List<ApprovalVo> getListByNo(SqlSessionTemplate sst, String empNo) {
		return sst.selectList("approvalMapper.getListByNo", empNo);
	}
	
	//기안서 하나 조회
	@Override
	public ApprovalVo getOneByNo(SqlSessionTemplate sst, String adcNo) {
		return sst.selectOne("approvalMapper.getOneByNo", adcNo);
	}

	//기안서 전체 조회
	@Override
	public List<ApprovalVo> getListAll(SqlSessionTemplate sst) {
		return sst.selectList("approvalMapper.getAllList");
	}

	//결재테이블 결재/합의/참조 업데이트
	@Override
	public int updateStatus(SqlSessionTemplate sst, Map updateInfo) {
		return sst.update("approvalMapper.updateStatus", updateInfo);
	}

	//첨부파일 insert
	@Override
	public int insertAprvAtt(SqlSessionTemplate sst, AprvAttVo vo) {
		return sst.insert("approvalMapper.insertAtt", vo);
	}

	//첨부파일 가져오기
	@Override
	public List<AprvAttVo> getAttList(SqlSessionTemplate sst, String adcNo) {
		return sst.selectList("approvalMapper.selectAttList", adcNo);
	}


	
	

	
	
}
