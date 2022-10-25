package com.bs.blind.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.blind.vo.BlindVo;
import com.bs.common.PageVo;

@Repository
public class BlindDaoImpl implements BlindDao{

	// 페이징 처리
	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("blindMapper.selectCountAll");
	}//selectCountAll

	// 게시글 목록 조회
	@Override
	public List<BlindVo> selectList(SqlSessionTemplate sst, PageVo pv, Map<String, String> map) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("blindMapper.selectList", map, rb);
	}//selectList

	// 조회수 증가
	@Override
	public int increaseCnt(SqlSessionTemplate sst, String boardNo) {
		return sst.update("blindMapper.increaseCnt", boardNo);
	}//increaseCnt

	// 게시글 상세 조회
	@Override
	public BlindVo selectOne(SqlSessionTemplate sst, String boardNo) {
		return sst.selectOne("blindMapper.selectOne", boardNo);
	}//selectOne

	// 게시글 삭제
	@Override
	public int delete(SqlSessionTemplate sst, String boardNo) {
		return sst.delete("blindMapper.deleteBoard", boardNo);
	}//delete

	// 게시글 작성
	@Override
	public int insertBoard(SqlSessionTemplate sst, BlindVo vo) {
		return sst.insert("blindMapper.insertBoard", vo);
	}//insertBoard


	// 게시글 수정
	@Override
	public int edit(SqlSessionTemplate sst, BlindVo vo) {
		return sst.update("blindMapper.edit", vo);
	}//updateBoard
	
}//class
