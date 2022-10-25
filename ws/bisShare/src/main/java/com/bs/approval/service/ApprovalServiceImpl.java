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
	public int insertOne(ApprovalVo avo) {
		//결재 내용 insert
		int result = dao.insertDocu(sst, avo);
		
		return result;
	}

	//내가 작성한 기안서 목록
	@Override
	public List<String> getListByEmpNo(String empNo) {
		return dao.getListByNo(sst, empNo);
	}

	@Override
	public ApprovalVo getOneByNo(String adcNo) {
		return dao.getOneByNo(sst, adcNo);
	}

	
	
	
	
}//class



















