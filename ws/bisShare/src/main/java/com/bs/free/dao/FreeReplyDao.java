package com.bs.free.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.free.vo.FreeReplyVo;

public interface FreeReplyDao {

	// 댓글 조회
	List<FreeReplyVo> selectList(SqlSessionTemplate sst, String boardNo);

	// 댓글 작성
	int insertReply(SqlSessionTemplate sst, FreeReplyVo vo);

	// 댓글 삭제
	int delete(SqlSessionTemplate sst, FreeReplyVo vo);

	// 댓글 수정
	int edit(SqlSessionTemplate sst, FreeReplyVo vo);
}//interface
