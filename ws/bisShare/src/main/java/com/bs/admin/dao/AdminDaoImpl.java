package com.bs.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.employee.vo.EmployeeVo;

@Repository
public class AdminDaoImpl implements AdminDao{

	// 사원 조회(전체)
	@Override
	public List<EmployeeVo> entireList(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("adminMapper.entireList", map);
	}//selectList

	
	// 사원 조회(재직)
	@Override
	public List<EmployeeVo> inList(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("adminMapper.inList", map);
	}//inList


	// 사원 관리 조회(퇴직)
	@Override
	public List<EmployeeVo> outList(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("adminMapper.outList", map);
	}//outList


	// 상세조회(사원번호로 조회) - 전체/재직/퇴직
	@Override
	public EmployeeVo selectOne(SqlSessionTemplate sst, String empNo) {
		return sst.selectOne("adminMapper.selectOne", empNo);
	}//selectOne


	// 수정하기
	@Override
	public int updateOne(SqlSessionTemplate sst, EmployeeVo vo) {
		return sst.update("adminMapper.updateOne", vo);
	}//updateOne



}//class
