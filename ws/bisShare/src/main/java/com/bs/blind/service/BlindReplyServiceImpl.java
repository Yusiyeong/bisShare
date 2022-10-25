package com.bs.blind.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.blind.dao.BlindReplyDao;
import com.bs.blind.vo.BlindReplyVo;

@Service
public class BlindReplyServiceImpl implements BlindReplyService{

	private final BlindReplyDao brd;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public BlindReplyServiceImpl(BlindReplyDao brd, SqlSessionTemplate sst) {
		super();
		this.brd = brd;
		this.sst = sst;
	}
	
	
	// 댓글 조회
	@Override
	public List<BlindReplyVo> selectList(String boardNo) {
		return brd.selectList(sst, boardNo);
	}//selectList

	// 댓글 작성
	@Override
	public int write(BlindReplyVo vo) {
		return brd.insertReply(sst, vo);
	}//write


	// 댓글 삭제
	@Override
	public int delete(BlindReplyVo vo) {
		return brd.delete(sst, vo);
	}//delete


	// 댓글 수정
	@Override
	public int edit(BlindReplyVo vo) {
		return brd.edit(sst, vo);
	}//edit
	
}//class
