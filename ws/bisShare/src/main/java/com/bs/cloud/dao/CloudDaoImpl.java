package com.bs.cloud.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.cloud.vo.CloudVo;
import com.bs.common.PageVo;

@Repository
public class CloudDaoImpl implements CloudDao{

	// 페이징 처리
	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("cloudMapper.selectCountAll");
	}//selectCountAll

	// 게시글 목록 조회
	@Override
	public List<CloudVo> selectList(SqlSessionTemplate sst, PageVo pv, Map<String, String> map) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("cloudMapper.selectList", map, rb);
	}//selectList

	// 게시글 작성 + 파일 업로드
	@Override
	public int insertBoard(SqlSessionTemplate sst, CloudVo vo) {
		return sst.insert("cloudMapper.insertBoard", vo);
	}//insertBoard

	// 조회수 증가
	@Override
	public int increaseCnt(SqlSessionTemplate sst, String boardNo) {
		return sst.update("cloudMapper.increaseCnt", boardNo);
	}//increaseCnt

	// 게시글 상세 조회
	@Override
	public CloudVo selectOne(SqlSessionTemplate sst, String boardNo) {
		return sst.selectOne("cloudMapper.selectOne", boardNo);
	}//selectOne

	// 게시글 수정
	@Override
	public int edit(SqlSessionTemplate sst, CloudVo vo) {
		return sst.update("cloudMapper.edit",vo);
	}//edit

	// 게시글 삭제
	@Override
	public int delete(SqlSessionTemplate sst, String boardNo) {
		return sst.delete("cloudMapper.deleteBoard", boardNo);
	}//delete

}//class
