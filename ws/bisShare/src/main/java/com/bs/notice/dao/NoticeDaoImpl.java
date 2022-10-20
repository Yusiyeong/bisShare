package com.bs.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.common.PageVo;
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
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("noticeMapper.selectList", map, rb);
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


}//class
