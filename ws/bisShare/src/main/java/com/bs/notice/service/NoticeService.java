package com.bs.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.common.PageVo;
import com.bs.notice.vo.NoticeAttachVo;
import com.bs.notice.vo.NoticeScrapVo;
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

	// 게시글 작성
	int write(NoticeVo vo);

	// 수정하기
	int edit(NoticeVo vo);

	// 중복방지
	int scrapCheck(NoticeScrapVo svo);

	int scrap(NoticeScrapVo svo);

	int scrapCancel(NoticeScrapVo svo);

	int scrapCount(String boardNo);

	// 스크랩 목록 조회
	List<NoticeScrapVo> selectScrapList(NoticeScrapVo vo);

	// 회원 해당 게시글 스크랩 여부
	NoticeScrapVo findScrap(String boardNo, String empNo);

	// 스크랩 목록 삭제
	int scrapDelete(String scrapNo);

	// 다음글, 이전글 
	NoticeVo movePage(String boardNo);

	// 댓글 수 업데이트(제목 옆 댓글 수 표시)
	int updateReplyCount(String boardNo);













}//interface
