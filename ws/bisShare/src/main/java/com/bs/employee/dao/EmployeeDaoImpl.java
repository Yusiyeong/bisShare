package com.bs.employee.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.employee.vo.EmployeeVo;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	// 로그인
	@Override
	public EmployeeVo selectOneById(SqlSessionTemplate sst, String id) {
		return sst.selectOne("employeeMapper.selectOneById", id);
	}//selectOneById

	// 사원 등록
	@Override
	public int insertOne(SqlSessionTemplate sst, EmployeeVo ev) {
		return sst.insert("employeeMapper.enroll", ev);
	}//insertOne

	@Override
	public List<EmployeeVo> getList(SqlSessionTemplate sst) {
		return sst.selectList("employeeMapper.getList");
	}

}//class
