package com.bs.mail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.employee.vo.EmployeeVo;
import com.bs.mail.vo.MailAttVo;
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
	public String selectStar(SqlSessionTemplate sst, MailVo mv) {
		return sst.selectOne("mailMapper.selectStar", mv);
	}
	
	@Override
	public void updateStar(SqlSessionTemplate sst, MailVo mv) {
		sst.update("mailMapper.updateStar", mv);
	}

	@Override
	public MailVo selectOne(SqlSessionTemplate sst, MailVo mv) {
		return sst.selectOne("mailMapper.selectOne",mv);
	}

	@Override
	public void updateReadYn(SqlSessionTemplate sst, MailVo mv) {
		sst.update("mailMapper.updateReadYn",mv);
	}

	@Override
	public List<MailVo> selectStarList(SqlSessionTemplate sst, String empNo) {
		return sst.selectList("mailMapper.selectStarList",empNo);
	}

	@Override
	public String selectnotReadCnt(SqlSessionTemplate sst, String empNo) {
		return sst.selectOne("mailMapper.selectNotReadCnt", empNo);
	}

	@Override
	public void insertRecInfo(SqlSessionTemplate sst, MailVo mv) {
		sst.insert("mailMapper.insertRecInfo", mv);
	}

	@Override
	public void insertMailAtt(SqlSessionTemplate sst, MailAttVo mav) {
		sst.insert("mailMapper.insertAtt", mav);
	}

	@Override
	public List<MailAttVo> selectFilePath(SqlSessionTemplate sst, MailVo mv) {
		return sst.selectList("mailMapper.selectFilePath",mv);
	}

	@Override
	public int updateCheckStatus(SqlSessionTemplate sst, String string) {
		return sst.update("mailMapper.updateCheckStatus",string);
	}

	@Override
	public List<MailVo> reference(SqlSessionTemplate sst, String empNo) {
		return sst.selectList("mailMapper.reference",empNo);
	}

	@Override
	public MailVo selectRefOne(SqlSessionTemplate sst, MailVo mv) {
		return sst.selectOne("mailMapper.selectRefOne",mv);
	}

}
