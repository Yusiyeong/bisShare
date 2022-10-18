package com.bs.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.employee.vo.EmployeeVo;

public interface AdminDao {

	// 사원 조회(전체)
	List<EmployeeVo> entireList(SqlSessionTemplate sst);

	// 사원 조회(재직)
	List<EmployeeVo> inList(SqlSessionTemplate sst);

	// 사원 관리 조회(퇴직)
	List<EmployeeVo> outList(SqlSessionTemplate sst);

	// 상세조회(사원번호로 조회) - 전체/재직/퇴직
	EmployeeVo selectOne(SqlSessionTemplate sst, String empNo);


}//selectList
