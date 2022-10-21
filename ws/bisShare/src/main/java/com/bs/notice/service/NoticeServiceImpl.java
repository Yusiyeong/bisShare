package com.bs.notice.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.common.PageVo;
import com.bs.notice.dao.NoticeDao;
import com.bs.notice.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService{

	private final SqlSessionTemplate sst;
	private final NoticeDao nd;
	
	// 생성자
	@Autowired
	public NoticeServiceImpl(SqlSessionTemplate sst, NoticeDao nd) {
		super();
		this.sst = sst;
		this.nd = nd;
	}
	
	
	// 페이징 처리
	@Override
	public int selectTotalCnt() {
		return nd.selectCountAll(sst);
	}//selectTotalCnt

	// 게시글 목록 조회
	@Override
	public List<NoticeVo> selectList(PageVo pv, Map<String, String> map) {
		return nd.selectList(sst, pv, map);
	}//selectList


	// 게시글 상세 조회 + 조회수 증가
	@Override
	public NoticeVo selectOne(String boardNo) {
		
		int result = nd.increaseCnt(sst, boardNo);	// 조회수 증가
		if(result == 1) {
			return nd.selectOne(sst, boardNo);	// 상세 조회
		}else {
			return null;
		}
		
	}//selectOne

	// 게시글 삭제
	@Override
	public int delete(String boardNo) {
		return nd.delete(sst, boardNo);
	}//delete






}//class
