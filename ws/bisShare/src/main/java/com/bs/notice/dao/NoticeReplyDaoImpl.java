package com.bs.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.notice.vo.NoticeReplyVo;

@Repository
public class NoticeReplyDaoImpl implements NoticeReplyDao{

	// 댓글 조회
	@Override
	public List<NoticeReplyVo> selectList(SqlSessionTemplate sst, String boardNo) {
		return sst.selectList("noticeReplyMapper.selectListByBno", boardNo);
	}//selectList

	// 댓글 작성
	@Override
	public int insertReply(SqlSessionTemplate sst, NoticeReplyVo vo) {
		return sst.insert("noticeReplyMapper.insertOne", vo);
	}//inserReply


}//NoticeReplyDaoImpl
