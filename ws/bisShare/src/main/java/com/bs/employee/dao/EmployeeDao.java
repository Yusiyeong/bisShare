package com.bs.employee.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.employee.vo.EmployeeVo;

public interface EmployeeDao {

	// 로그인
	EmployeeVo selectOneById(SqlSessionTemplate sst, String id);

	// 사원 등록
	int insertOne(SqlSessionTemplate sst, EmployeeVo ev);

}//interface
