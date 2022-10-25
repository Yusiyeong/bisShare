package com.bs.free.service;

import java.util.List;
import java.util.Map;

import com.bs.common.PageVo;
import com.bs.free.vo.FreeVo;
import com.bs.notice.vo.NoticeVo;

public interface FreeService {

	// 페이징 처리
	int selectTotalCnt();

	// 게시글 목록 조회
	List<FreeVo> selectList(PageVo pv, Map<String, String> map);

	// 게시글 상세 조회
	FreeVo selectOne(String boardNo);

	// 게시글 삭제
	int delete(String boardNo);

	// 게시글 작성
	int write(FreeVo vo);

	// 게시글 수정
	int edit(FreeVo vo);

}//interface
