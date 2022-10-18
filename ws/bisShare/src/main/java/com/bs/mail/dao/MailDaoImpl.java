package com.bs.mail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.employee.vo.EmployeeVo;
import com.bs.mail.vo.MailVo;

@Repository
public class MailDaoImpl implements MailDao{

	@Override
	public int insertOne(SqlSessionTemplate sst, MailVo mv) {
		return sst.insert("mailMapper.insertOne", mv);
	}

	@Override
	public List<MailVo> selectAll(SqlSessionTemplate sst, String empNo) {
		return sst.selectList("mailMapper.selectAll", empNo);
	}
	
	@Override
	public String selectStar(SqlSessionTemplate sst, String mailNo) {
		return sst.selectOne("mailMapper.selectStar", mailNo);
	}
	
	@Override
	public void updateStar(SqlSessionTemplate sst, MailVo mv) {
		sst.update("mailMapper.updateStar", mv);
	}

	@Override
	public MailVo selectOne(SqlSessionTemplate sst, String mailNo) {
		return sst.selectOne("mailMapper.selectOne",mailNo);
	}

	@Override
	public void updateReadYn(SqlSessionTemplate sst, String mailNo) {
		sst.update("mailMapper.updateReadYn",mailNo);
	}

	@Override
	public List<MailVo> selectStarList(SqlSessionTemplate sst, String empNo) {
		return sst.selectList("mailMapper.selectStarList",empNo);
	}

	@Override
	public String selectnotReadCnt(SqlSessionTemplate sst, String empNo) {
		return sst.selectOne("mailMapper.selectNotReadCnt", empNo);
	}
}
