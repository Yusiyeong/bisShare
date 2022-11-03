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
	public int updateCheckStatus(SqlSessionTemplate sst, MailVo mv) {
		return sst.update("mailMapper.updateCheckStatus",mv);
	}

	@Override
	public List<MailVo> reference(SqlSessionTemplate sst, String empNo) {
		return sst.selectList("mailMapper.reference",empNo);
	}

	@Override
	public MailVo selectRefOne(SqlSessionTemplate sst, MailVo mv) {
		return sst.selectOne("mailMapper.selectRefOne",mv);
	}

	@Override
	public String selectReferences(SqlSessionTemplate sst, MailVo mv) {
		return sst.selectOne("mailMapper.selectRef", mv);
	}

	@Override
	public List<MailVo> selectSendList(SqlSessionTemplate sst, String empNo) {
		return sst.selectList("mailMapper.selectSendList",empNo);
	}

	@Override
	public MailVo selectSendOne(SqlSessionTemplate sst, MailVo mv) {
		return sst.selectOne("mailMapper.selectSendOne",mv);
	}

	@Override
	public String selectSendReferences(SqlSessionTemplate sst, MailVo mv) {
		return sst.selectOne("mailMapper.selectSendRef", mv);
	}

	@Override
	public List<MailVo> selectStatusOne(SqlSessionTemplate sst, String empNo) {
		return sst.selectList("mailMapper.selectStatusOne",empNo);
	}

	@Override
	public List<MailVo> selectTrashOne(SqlSessionTemplate sst, MailVo mv) {
		return sst.selectList("mailMapper.selectTrashOne", mv);
	}

	@Override
	public List<MailVo> selectTrashReferences(SqlSessionTemplate sst, MailVo mv) {
		return sst.selectList("mailMapper.selectTrashRef", mv);
	}

	@Override
	public String selectRefForRef(SqlSessionTemplate sst, MailVo mv) {
		return sst.selectOne("mailMapper.selectRefForRef", mv);
	}

	@Override
	public List<MailVo> selectDraft(SqlSessionTemplate sst, String empNo) {
		return sst.selectList("mailMapper.selectDraft",empNo);
	}

	@Override
	public int insertDraft(SqlSessionTemplate sst, MailVo mv) {
		return sst.insert("mailMapper.insertDraft",mv);
	}

	@Override
	public MailVo selectDraftDetail(SqlSessionTemplate sst, String mailNo) {
		return sst.selectOne("mailMapper.selectDraftDetail",mailNo);
	}

	@Override
	public int updateCheckStatusDraft(SqlSessionTemplate sst, MailVo mv) {
		return sst.update("mailMapper.updateCheckStatusDraft",mv);
	}

	@Override
	public void insertDraftAtt(SqlSessionTemplate sst, MailAttVo mav) {
		sst.insert("mailMapper.insertDraftAtt", mav);
	}

	@Override
	public List<MailAttVo> selectDraftFilePath(SqlSessionTemplate sst, String mailNo) {
		return sst.selectList("mailMapper.selectDraftFilePath",mailNo);
	}

	@Override
	public List<MailVo> selectUnreadMailList(SqlSessionTemplate sst, String empNo) {
		return sst.selectList("mailMapper.selectUnreadMailList",empNo);
	}


}
