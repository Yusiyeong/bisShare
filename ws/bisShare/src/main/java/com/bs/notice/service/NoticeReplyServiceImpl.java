package com.bs.notice.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.notice.dao.NoticeReplyDao;
import com.bs.notice.vo.NoticeReplyVo;

@Service
public class NoticeReplyServiceImpl implements NoticeReplyService{

	private final NoticeReplyDao nrd;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public NoticeReplyServiceImpl(NoticeReplyDao nrd, SqlSessionTemplate sst) {
		super();
		this.nrd = nrd;
		this.sst = sst;
	}


	// 댓글 조회
	@Override
	public List<NoticeReplyVo> selectList(String boardNo) {
		return nrd.selectList(sst, boardNo);
	}//selectList

	// 댓글 작성
	@Override
	public int write(NoticeReplyVo vo) {
		return nrd.insertReply(sst, vo);
	}//write


	// 댓글 삭제
	@Override
	public int delete(NoticeReplyVo vo) {
		return nrd.delete(sst, vo);
	}//delete


	// 댓글 수정
	@Override
	public int edit(NoticeReplyVo vo) {
		return nrd.edit(sst, vo);
	}//edit



	

}//class
