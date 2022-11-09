package com.bs.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.common.PageVo;
import com.bs.notice.vo.NoticeAttachVo;
import com.bs.notice.vo.NoticeScrapVo;
import com.bs.notice.vo.NoticeVo;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	// 페이징 처리
	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("noticeMapper.selectCountAll");
	}//selectCountAll

	// 게시글 목록 조회
	@Override
	public List<NoticeVo> selectList(SqlSessionTemplate sst, PageVo pv, Map<String, String> map) {
		if(pv != null && map != null) {
			int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
			RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
			
			return sst.selectList("noticeMapper.selectList", map, rb);
		} else {
			return sst.selectList("noticeMapper.selectList");
		}
	}//selectList

	// 조회수 증가
	@Override
	public int increaseCnt(SqlSessionTemplate sst, String boardNo) {
		return sst.update("noticeMapper.increaseCnt", boardNo);
	}//increaseCnt

	// 게시글 상세 조회
	@Override
	public NoticeVo selectOne(SqlSessionTemplate sst, String boardNo) {
		return sst.selectOne("noticeMapper.selectOne", boardNo);
	}//selectOne

	// 게시글 삭제
	@Override
	public int delete(SqlSessionTemplate sst, String boardNo) {
		return sst.delete("noticeMapper.deleteBoard", boardNo);
	}//delete

	// 게시글 작성
	@Override
	public int insertBoard(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.insert("noticeMapper.insertBoard", vo);
	}//insertBoard


	// 게시글 수정
	@Override
	public int edit(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.update("noticeMapper.edit", vo);
	}//updateBoard


	//중복방지 
	@Override
	public int scrapCheck(SqlSessionTemplate sst, NoticeScrapVo svo) {
		return sst.selectOne("noticeMapper.scrapCheck", svo);
	}

	//스크랩 기능
	@Override
	public int scrap(SqlSessionTemplate sst, NoticeScrapVo svo) {
		return sst.insert("noticeMapper.scrap", svo);
	}

	//스크랩 취소
	@Override
	public int scrapCancel(SqlSessionTemplate sst, NoticeScrapVo svo) {
		return sst.delete("noticeMapper.scrapCancel", svo);
	}

	// 게시글의 스크랩 수
	@Override
	public int scrapCount(SqlSessionTemplate sst, String boardNo) {
		return sst.selectOne("noticeMapper.scrapCount", boardNo);
	}

	// 스크랩 목록 조회
	@Override
	public List<NoticeScrapVo> selectScrapList(SqlSessionTemplate sst, NoticeScrapVo svo) {
		return sst.selectList("noticeMapper.selectScrapList", svo);
	}//selectScrapList

	// 회원 해당 게시글 스크랩 여부
	@Override
	public NoticeScrapVo findScrap(SqlSessionTemplate sst, Map<String, String> number) {
		return sst.selectOne("noticeMapper.findScrap", number);
	}//findScrap

	// 스크랩 목록 삭제
	@Override
	public int scrapDelete(SqlSessionTemplate sst, String scrapNo) {
		return sst.delete("noticeMapper.scrapDelete", scrapNo);
	}//scrapDelete

	// 다음글, 이전글 
	@Override
	public NoticeVo movePage(SqlSessionTemplate sst, String boardNo) {
		return sst.selectOne("noticeMapper.movePage", boardNo);
	}//movePage

	// 댓글 수 업데이트(제목 옆 댓글 수 표시)
	@Override
	public int updateReplyCount(SqlSessionTemplate sst, String boardNo) {
		return sst.update("noticeMapper.updateReplyCount", boardNo);
	}//updateReplyCount





	
}//class
