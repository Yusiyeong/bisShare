package com.bs.approval.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bs.approval.dao.ApprovalDao;
import com.bs.approval.vo.ApprovalVo;

@Service
public class ApprovalServiceImpl implements ApprovalService{

	private final SqlSessionTemplate sst;
	private final ApprovalDao dao;
	
	public ApprovalServiceImpl(SqlSessionTemplate sst, ApprovalDao dao) {
		super();
		this.sst = sst;
		this.dao = dao;
	}

	@Override
	@Transactional
	public int insertOne(ApprovalVo avo) {
		//결재 내용 insert
		int result1 = dao.insertDocu(sst, avo);
		
		//결재권자 insert
		int result2 = 0;
		Map<String, String> aprvMap = new HashMap<String, String>();
		for(int i = 0; i < avo.getAprvEmpNo().length; ++i) {
			aprvMap.put("aprvEmpNo", avo.getAprvEmpNo()[i]);
			aprvMap.put("aprvNo", avo.getAprvNo()[i]);
			result2 += dao.insertAprver(sst,aprvMap);
		}
		
		//합의자 insert
		int result3 = 0;
		if(avo.getAgreeEmpNo().length!=0) {
			Map<String, String> agreeMap = new HashMap<String, String>();
			for(int i = 0; i < avo.getAgreeEmpNo().length; ++i) {
				agreeMap.put("agreeEmpNo", avo.getAgreeEmpNo()[i]);
				agreeMap.put("agreeNo", avo.getAgreeNo()[i]);
				result3 += dao.insertAgree(sst,agreeMap);
			}
		}
		
		//참조자 insert
		int result4 = 0;
		if(avo.getRefEmpNo().length!=0) {
			Map<String, String> refMap = new HashMap<String, String>();
			for(int i = 0; i < avo.getRefEmpNo().length; ++i) {
				refMap.put("refEmpNo", avo.getRefEmpNo()[i]);
				refMap.put("refNo", avo.getRefNo()[i]);
				result4 += dao.insertRef(sst,refMap);
			}
		}
		
		int result = result1+result2+result3+result4;
		
		return result;
	}

	//내가 작성한 기안서 목록
	@Override
	public List<String> getListByEmpNo(String empNo) {
		return dao.getListByNo(sst, empNo);
	}

	
	
	
	
}//class



















