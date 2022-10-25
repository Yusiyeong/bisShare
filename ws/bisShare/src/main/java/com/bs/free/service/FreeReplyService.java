package com.bs.free.service;

import java.util.List;

import com.bs.free.vo.FreeReplyVo;

public interface FreeReplyService {

	// 댓글 조회
	List<FreeReplyVo> selectList(String boardNo);

	// 댓글 작성
	int write(FreeReplyVo vo);

	// 댓글 삭제 
	int delete(FreeReplyVo vo);

	// 댓글 수정
	int edit(FreeReplyVo vo);

		
}//interface
