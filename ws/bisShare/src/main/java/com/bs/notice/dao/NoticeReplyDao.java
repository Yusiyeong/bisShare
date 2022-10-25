package com.bs.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.notice.vo.NoticeReplyVo;

public interface NoticeReplyDao {

	// 댓글 조회
	List<NoticeReplyVo> selectList(SqlSessionTemplate sst, String boardNo);

	// 댓글 작성
	int insertReply(SqlSessionTemplate sst, NoticeReplyVo vo);

	// 댓글 삭제
	int delete(SqlSessionTemplate sst, NoticeReplyVo vo);

	// 댓글 수정
	int edit(SqlSessionTemplate sst, NoticeReplyVo vo);



}//interface
