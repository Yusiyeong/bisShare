package com.bs.notice.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.common.PageVo;
import com.bs.notice.vo.NoticeAttachVo;
import com.bs.notice.vo.NoticeScrapVo;
import com.bs.notice.vo.NoticeVo;

public interface NoticeDao {

	// 페이징 처리
	int selectCountAll(SqlSessionTemplate sst);

	// 게시글 목록 조회
	List<NoticeVo> selectList(SqlSessionTemplate sst, PageVo pv, Map<String, String> map);

	// 조회수 증가
	int increaseCnt(SqlSessionTemplate sst, String boardNo);

	// 게시글 상세 조회
	NoticeVo selectOne(SqlSessionTemplate sst, String boardNo);

	// 게시글 삭제
	int delete(SqlSessionTemplate sst, String boardNo);

	// 게시글 작성
	int insertBoard(SqlSessionTemplate sst, NoticeVo vo);

	// 게시글 수정
	int edit(SqlSessionTemplate sst, NoticeVo vo);

	int scrapCheck(SqlSessionTemplate sst, NoticeScrapVo svo);

	int scrap(SqlSessionTemplate sst, NoticeScrapVo svo);

	int scrapCancel(SqlSessionTemplate sst, NoticeScrapVo svo);

	int scrapCount(SqlSessionTemplate sst, String boardNo);

	// 스크랩 목록 조회
	List<NoticeScrapVo> selectScrapList(SqlSessionTemplate sst, NoticeScrapVo svo);

	// 회원 해당 게시글 스크랩 여부
	NoticeScrapVo findScrap(SqlSessionTemplate sst, Map<String, String> number);

	// 스크랩 목록 삭제
	int scrapDelete(SqlSessionTemplate sst, String scrapNo);

	// 다음글, 이전글 
	NoticeVo movePage(SqlSessionTemplate sst, String boardNo);

	// 댓글 수 업데이트(제목 옆 댓글 수 표시)
	int updateReplyCount(SqlSessionTemplate sst, String boardNo);






}//interface
