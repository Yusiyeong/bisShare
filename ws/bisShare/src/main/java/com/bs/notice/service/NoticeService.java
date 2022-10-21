package com.bs.notice.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.common.PageVo;
import com.bs.notice.vo.NoticeVo;

public interface NoticeService {

	// 페이징 처리
	int selectTotalCnt();

	// 게시글 목록 조회
	List<NoticeVo> selectList(PageVo pv, Map<String, String> map);

	// 게시글 상세 조회
	NoticeVo selectOne(String boardNo);

	// 게시글 삭제
	int delete(String boardNo);


}//interface
