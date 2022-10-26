package com.bs.notice.service;

import java.util.List;

import com.bs.notice.vo.NoticeReplyVo;

public interface NoticeReplyService {

	// 댓글 조회
	List<NoticeReplyVo> selectList(String boardNo);

	// 댓글 작성
	int write(NoticeReplyVo vo);

	// 댓글 삭제 
	int delete(NoticeReplyVo vo);

	// 댓글 수정
	int edit(NoticeReplyVo vo);



}//interface
