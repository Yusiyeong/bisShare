package com.bs.blind.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.blind.vo.BlindReplyVo;


public interface BlindReplyDao {

	// 댓글 조회
	List<BlindReplyVo> selectList(SqlSessionTemplate sst, String boardNo);

	// 댓글 작성
	int insertReply(SqlSessionTemplate sst, BlindReplyVo vo);

	// 댓글 삭제
	int delete(SqlSessionTemplate sst, BlindReplyVo vo);

	// 댓글 수정
	int edit(SqlSessionTemplate sst, BlindReplyVo vo);
	
}//interface
