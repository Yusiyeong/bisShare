package com.bs.free.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.free.dao.FreeReplyDao;
import com.bs.free.vo.FreeReplyVo;

@Service
public class FreeReplyServiceImpl implements FreeReplyService{

	private final SqlSessionTemplate sst;
	private final FreeReplyDao frd;
	
	@Autowired
	public FreeReplyServiceImpl(SqlSessionTemplate sst, FreeReplyDao frd) {
		super();
		this.sst = sst;
		this.frd = frd;
	}

	// 댓글 조회
	@Override
	public List<FreeReplyVo> selectList(String boardNo) {
		return frd.selectList(sst, boardNo);
	}//selectList
	
	// 댓글 작성
	@Override
	public int write(FreeReplyVo vo) {
		return frd.insertReply(sst, vo);
	}//write


	// 댓글 삭제
	@Override
	public int delete(FreeReplyVo vo) {
		return frd.delete(sst, vo);
	}//delete


	// 댓글 수정
	@Override
	public int edit(FreeReplyVo vo) {
		return frd.edit(sst, vo);
	}//edit
	
}//class
