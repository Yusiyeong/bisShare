package com.bs.mail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.mail.vo.MailAttVo;
import com.bs.mail.vo.MailVo;

public interface MailDao {

	int insertOne(SqlSessionTemplate sst, MailVo mv);

	List<MailVo> selectAll(SqlSessionTemplate sst, String empNo);

	String selectStar(SqlSessionTemplate sst, String mailNo);
	
	void updateStar(SqlSessionTemplate sst, MailVo mv);

	MailVo selectOne(SqlSessionTemplate sst, MailVo mv);

	void updateReadYn(SqlSessionTemplate sst, MailVo mv);

	List<MailVo> selectStarList(SqlSessionTemplate sst, String empNo);

	String selectnotReadCnt(SqlSessionTemplate sst, String empNo);

	void insertRecInfo(SqlSessionTemplate sst, MailVo mv);

	void insertMailAtt(SqlSessionTemplate sst, MailAttVo mav);

	List<MailAttVo> selectFilePath(SqlSessionTemplate sst, MailVo mv);



}
