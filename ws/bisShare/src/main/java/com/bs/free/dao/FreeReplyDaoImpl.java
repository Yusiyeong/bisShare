package com.bs.free.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.free.vo.FreeReplyVo;

@Repository
public class FreeReplyDaoImpl implements FreeReplyDao{

	// 댓글 조회
	@Override
	public List<FreeReplyVo> selectList(SqlSessionTemplate sst, String boardNo) {
		return sst.selectList("freeReplyMapper.selectListByBno", boardNo);
	}//selectList
	
	// 댓글 작성
	@Override
	public int insertReply(SqlSessionTemplate sst, FreeReplyVo vo) {
		return sst.insert("freeReplyMapper.insertOne", vo);
	}//inserReply

	// 댓글 삭제
	@Override
	public int delete(SqlSessionTemplate sst, FreeReplyVo vo) {
		return sst.update("freeReplyMapper.deleteReply", vo);
	}//update

	// 댓글 수정
	@Override
	public int edit(SqlSessionTemplate sst, FreeReplyVo vo) {
		return sst.update("freeReplyMapper.updateOne", vo);
	}//edit

}//class
