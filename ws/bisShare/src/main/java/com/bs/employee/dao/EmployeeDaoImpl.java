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

	// 아이디 중복체크
	@Override
	public int idDup(SqlSessionTemplate sst, String memberId) {
		return sst.selectOne("employeeMapper.idDup", memberId);
	}//idDup

	// 닉네임 중복
	@Override
	public int nickDup(SqlSessionTemplate sst, String memberNick) {
		return sst.selectOne("employeeMapper.nickDup", memberNick);
	}//nickDup

	//속해있는 회사의 모든 부서 조회
	@Override
	public List<EmployeeVo> getDeptList(SqlSessionTemplate sst, String compNo) {
		return sst.selectList("employeeMapper.getDeptList", compNo);
	}

	// 퇴직처리
	@Override
	public int quit(SqlSessionTemplate sst, String memberId) {
		return sst.update("employeeMapper.quit", memberId);
	}//quit


}//class
