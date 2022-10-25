package com.bs.free.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.common.PageVo;
import com.bs.free.vo.FreeVo;
import com.bs.notice.vo.NoticeVo;

@Repository
public class FreeDaoImpl implements FreeDao{

	// 페이징 처리
	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("freeMapper.selectCountAll");
	}//selectCountAll

	// 게시글 목록 조회
	@Override
	public List<FreeVo> selectList(SqlSessionTemplate sst, PageVo pv, Map<String, String> map) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("freeMapper.selectList", map, rb);
	}//selectList

	// 조회수 증가
	@Override
	public int increaseCnt(SqlSessionTemplate sst, String boardNo) {
		return sst.update("freeMapper.increaseCnt", boardNo);
	}//increaseCnt

	// 게시글 상세 조회
	@Override
	public FreeVo selectOne(SqlSessionTemplate sst, String boardNo) {
		return sst.selectOne("freeMapper.selectOne", boardNo);
	}//selectOne

	// 게시글 삭제
	@Override
	public int delete(SqlSessionTemplate sst, String boardNo) {
		return sst.delete("freeMapper.deleteBoard", boardNo);
	}//delete

	// 게시글 작성
	@Override
	public int insertBoard(SqlSessionTemplate sst, FreeVo vo) {
		return sst.insert("freeMapper.insertBoard", vo);
	}//insertBoard

	// 게시글 수정
	@Override
	public int edit(SqlSessionTemplate sst, FreeVo vo) {
		return sst.update("freeMapper.edit", vo);
	}//edit

}//class
