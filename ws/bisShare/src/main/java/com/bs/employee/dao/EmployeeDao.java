package com.bs.employee.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.employee.vo.EmployeeVo;

public interface EmployeeDao {

	// 로그인
	EmployeeVo selectOneById(SqlSessionTemplate sst, String id);

	// 사원 등록
	int insertOne(SqlSessionTemplate sst, EmployeeVo ev);

	List<EmployeeVo> getList(SqlSessionTemplate sst);

}//interface
