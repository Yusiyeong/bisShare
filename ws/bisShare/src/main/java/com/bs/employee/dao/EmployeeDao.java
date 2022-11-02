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

	// 아이디 중복체크
	int idDup(SqlSessionTemplate sst, String memberId);

	// 닉네임 중복
	int nickDup(SqlSessionTemplate sst, String memberNick);

}//interface
