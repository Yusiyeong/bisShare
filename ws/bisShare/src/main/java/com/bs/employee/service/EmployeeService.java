package com.bs.employee.service;

import java.util.List;

import com.bs.employee.vo.EmployeeVo;

public interface EmployeeService {

	// 로그인
	EmployeeVo login(EmployeeVo ev);
	
	// 사원등록
	int insertMember(EmployeeVo ev);

	List<EmployeeVo> getList();

	
}//interface
