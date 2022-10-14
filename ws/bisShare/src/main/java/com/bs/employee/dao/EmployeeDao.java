package com.bs.employee.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.employee.vo.EmployeeVo;

public interface EmployeeDao {

	EmployeeVo selectOneById(SqlSessionTemplate sst, String id);

}
