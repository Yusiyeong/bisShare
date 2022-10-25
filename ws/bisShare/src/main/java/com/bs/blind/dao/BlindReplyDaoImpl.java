package com.bs.blind.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.blind.vo.BlindReplyVo;


@Repository
public class BlindReplyDaoImpl implements BlindReplyDao{

	// 댓글 조회
	@Override
	public List<BlindReplyVo> selectList(SqlSessionTemplate sst, String boardNo) {
		return sst.selectList("blindReplyMapper.selectListByBno", boardNo);
	}//selectList

	// 댓글 작성
	@Override
	public int insertReply(SqlSessionTemplate sst, BlindReplyVo vo) {
		return sst.insert("blindReplyMapper.insertOne", vo);
	}//inserReply

	// 댓글 삭제
	@Override
	public int delete(SqlSessionTemplate sst, BlindReplyVo vo) {
		return sst.update("blindReplyMapper.deleteReply", vo);
	}//update

	// 댓글 수정
	@Override
	public int edit(SqlSessionTemplate sst, BlindReplyVo vo) {
		return sst.update("blindReplyMapper.updateOne", vo);
	}//edit
	
}//class
