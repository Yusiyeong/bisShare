package com.bs.employee.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.employee.vo.EmployeeVo;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Override
	public EmployeeVo selectOneById(SqlSessionTemplate sst, String id) {
		return sst.selectOne("employeeMapper.selectOneById", id);
	}

}
