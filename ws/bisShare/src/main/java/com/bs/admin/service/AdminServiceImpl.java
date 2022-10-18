package com.bs.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.admin.dao.AdminDao;
import com.bs.employee.vo.EmployeeVo;

@Service
public class AdminServiceImpl implements AdminService{

	private final AdminDao ad;
	private final SqlSessionTemplate sst;
	
	// 생성자
	@Autowired
	public AdminServiceImpl(AdminDao ad, SqlSessionTemplate sst) {
		super();
		this.ad = ad;
		this.sst = sst;
	}

	// 전체 사원 조회
	@Override
	public List<EmployeeVo> entireList() {
		return ad.entireList(sst);
	}//selectList

	// 사원 조회(재직)
	@Override
	public List<EmployeeVo> inList() {
		return ad.inList(sst);
	}//inList

	// 사원 관리 조회(퇴직)
	@Override
	public List<EmployeeVo> outList() {
		return ad.outList(sst);
	}//outList

	// 상세조회(사원번호로 조회) - 전체/재직/퇴직
	@Override
	public EmployeeVo selectOne(String empNo) {
		return ad.selectOne(sst, empNo);
	}//selectOne
	
	
}//class
