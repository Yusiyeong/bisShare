package com.bs.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.common.PageVo;
import com.bs.notice.dao.NoticeDao;
import com.bs.notice.vo.NoticeScrapVo;
import com.bs.notice.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService{

	private final SqlSessionTemplate sst;
	private final NoticeDao nd;
	
	// 생성자
	@Autowired
	public NoticeServiceImpl(SqlSessionTemplate sst, NoticeDao nd) {
		super();
		this.sst = sst;
		this.nd = nd;
	}
	
	// 페이징 처리
	@Override
	public int selectTotalCnt() {
		return nd.selectCountAll(sst);
	}//selectTotalCnt

	// 게시글 목록 조회
	@Override
	public List<NoticeVo> selectList(PageVo pv, Map<String, String> map) {
		return nd.selectList(sst, pv, map);
	}//selectList


	// 게시글 상세 조회 + 조회수 증가
	@Override
	public NoticeVo selectOne(String boardNo) {
		
		int result = nd.increaseCnt(sst, boardNo);	// 조회수 증가
		if(result == 1) {
			return nd.selectOne(sst, boardNo);	// 상세 조회
		}else {
			return null;
		}
		
	}//selectOne

	// 게시글 삭제
	@Override
	public int delete(String boardNo) {
		return nd.delete(sst, boardNo);
	}//delete


	// 게시글 작성
	@Override
	public int write(NoticeVo vo) {
		return nd.insertBoard(sst, vo);
	}//write


	// 수정하기
	@Override
	public int edit(NoticeVo vo) {
		return nd.edit(sst, vo);
	}//edit

	// 스크랩 중복방지//했는지 안했는지 체크
	@Override
	public int scrapCheck(NoticeScrapVo svo) {
		return nd.scrapCheck(sst, svo);
	}

	// 스크랩 하기
	@Override
	public int scrap(NoticeScrapVo svo) {
		return nd.scrap(sst, svo);
	}

	// 스크랩 취소 
	@Override
	public int scrapCancel(NoticeScrapVo svo) {
		return nd.scrapCancel(sst, svo);
	}

	//게시글의 스크랩 수 
	@Override
	public int scrapCount(String boardNo) {
		return nd.scrapCount(sst, boardNo);
	}

	// 스크랩 목록 조회
	@Override
	public List<NoticeScrapVo> selectScrapList(NoticeScrapVo svo) {
		return nd.selectScrapList(sst, svo);
	}//selectScrapList

	// 회원 해당 게시글 스크랩 여부
	@Override
	public NoticeScrapVo findScrap(String boardNo, String empNo) {
		Map<String, String> number = new HashMap<String, String>();
		number.put("boardNo", boardNo);
		number.put("empNo", empNo);
		return nd.findScrap(sst, number);		
	}//findScrap

	// 스크랩 목록 삭제
	@Override
	public int scrapDelete(String scrapNo) {
		return nd.scrapDelete(sst, scrapNo);		
	}//scrapDelete

	// 다음글, 이전글 
	@Override
	public NoticeVo movePage(String boardNo) {
		return nd.movePage(sst, boardNo);		
	}//movePage

	// 댓글 수 업데이트(제목 옆 댓글 수 표시)
	@Override
	public int updateReplyCount(String boardNo) {
		return nd.updateReplyCount(sst, boardNo);
	}//updateReplyCount









}//class
