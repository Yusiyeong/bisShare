package com.bs.blind.service;

import java.util.List;
import java.util.Map;

import com.bs.blind.vo.BlindVo;
import com.bs.common.PageVo;

public interface BlindService {

	// 페이징 처리
	int selectTotalCnt();

	// 게시글 목록 조회
	List<BlindVo> selectList(PageVo pv, Map<String, String> map);

	// 게시글 상세 조회
	BlindVo selectOne(String boardNo);

	// 게시글 삭제
	int delete(String boardNo);

	// 게시글 작성
	int write(BlindVo vo);

	// 수정하기
	int edit(BlindVo vo);

		
}//interface
