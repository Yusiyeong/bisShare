package com.bs.blind.service;

import java.util.List;

import com.bs.blind.vo.BlindReplyVo;


public interface BlindReplyService {

	// 댓글 조회
	List<BlindReplyVo> selectList(String boardNo);

	// 댓글 작성
	int write(BlindReplyVo vo);

	// 댓글 삭제 
	int delete(BlindReplyVo vo);

	// 댓글 수정
	int edit(BlindReplyVo vo);
		
}//interface
