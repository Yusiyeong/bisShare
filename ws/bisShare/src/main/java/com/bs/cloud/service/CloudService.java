package com.bs.cloud.service;

import java.util.List;
import java.util.Map;

import com.bs.cloud.vo.CloudVo;
import com.bs.common.PageVo;

public interface CloudService {

	// 페이징 처리
	int selectTotalCnt();

	// 게시글 목록 조회
	List<CloudVo> selectList(PageVo pv, Map<String, String> map);

	// 게시글 작성 + 파일 업로드
	int write(CloudVo vo);

	// 게시글 상세조회
	CloudVo selectOne(String boardNo);

	// 게시글 수정
	int edit(CloudVo vo);

	// 게시글 삭제하기
	int delete(String boardNo);

}//interface
