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

	//속해있는 회사의 모든 부서 조회
	List<EmployeeVo> getDeptList(SqlSessionTemplate sst, String compNo);

	// 퇴직처리
	int quit(SqlSessionTemplate sst, String memberId);

}//interface
