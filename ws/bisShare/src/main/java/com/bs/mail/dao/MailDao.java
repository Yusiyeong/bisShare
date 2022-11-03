package com.bs.mail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.mail.vo.MailAttVo;
import com.bs.mail.vo.MailVo;

public interface MailDao {

	int insertOne(SqlSessionTemplate sst, MailVo mv);

	List<MailVo> selectAll(SqlSessionTemplate sst, String empNo);

	String selectStar(SqlSessionTemplate sst, MailVo mv);
	
	void updateStar(SqlSessionTemplate sst, MailVo mv);

	MailVo selectOne(SqlSessionTemplate sst, MailVo mv);

	void updateReadYn(SqlSessionTemplate sst, MailVo mv);

	List<MailVo> selectStarList(SqlSessionTemplate sst, String empNo);

	String selectnotReadCnt(SqlSessionTemplate sst, String empNo);

	void insertRecInfo(SqlSessionTemplate sst, MailVo mv);

	void insertMailAtt(SqlSessionTemplate sst, MailAttVo mav);

	List<MailAttVo> selectFilePath(SqlSessionTemplate sst, MailVo mv);

	int updateCheckStatus(SqlSessionTemplate sst, MailVo mv);

	List<MailVo> reference(SqlSessionTemplate sst, String empNo);

	MailVo selectRefOne(SqlSessionTemplate sst, MailVo mv);

	String selectReferences(SqlSessionTemplate sst, MailVo mv);

	List<MailVo> selectSendList(SqlSessionTemplate sst, String empNo);

	MailVo selectSendOne(SqlSessionTemplate sst, MailVo mv);

	String selectSendReferences(SqlSessionTemplate sst, MailVo mv);

	List<MailVo> selectStatusOne(SqlSessionTemplate sst, String empNo);

	List<MailVo> selectTrashOne(SqlSessionTemplate sst, MailVo mv);

	List<MailVo> selectTrashReferences(SqlSessionTemplate sst, MailVo mv);

	String selectRefForRef(SqlSessionTemplate sst, MailVo mv);

	List<MailVo> selectDraft(SqlSessionTemplate sst, String empNo);

	int insertDraft(SqlSessionTemplate sst, MailVo mv);

	MailVo selectDraftDetail(SqlSessionTemplate sst, String mailNo);

	int updateCheckStatusDraft(SqlSessionTemplate sst, MailVo mv);

	void insertDraftAtt(SqlSessionTemplate sst, MailAttVo mav);

	List<MailAttVo> selectDraftFilePath(SqlSessionTemplate sst, String mailNo);

	List<MailVo> selectUnreadMailList(SqlSessionTemplate sst, String empNo);



}
