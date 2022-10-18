package com.bs.admin.service;

import java.util.List;

import com.bs.employee.vo.EmployeeVo;

public interface AdminService {

	// 사원 조회(전체)
	List<EmployeeVo> entireList();

	// 사원 조회(재직)
	List<EmployeeVo> inList();

	// 사원 관리 조회(퇴직)
	List<EmployeeVo> outList();

	// 상세조회(사원번호로 조회) - 전체/재직/퇴직
	EmployeeVo selectOne(String empNo);


}//interface
