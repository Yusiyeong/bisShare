package com.bs.free.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.common.PageVo;
import com.bs.free.dao.FreeDao;
import com.bs.free.vo.FreeVo;
import com.bs.notice.vo.NoticeVo;

@Service
public class FreeServiceImpl implements FreeService{

	private final SqlSessionTemplate sst;
	private final FreeDao fd;
	
	@Autowired
	public FreeServiceImpl(SqlSessionTemplate sst, FreeDao fd) {
		super();
		this.sst = sst;
		this.fd = fd;
	}

	// 페이징 처리
	@Override
	public int selectTotalCnt() {
		return fd.selectCountAll(sst);
	}//selectTotalCnt

	// 게시글 목록 조회
	@Override
	public List<FreeVo> selectList(PageVo pv, Map<String, String> map) {
		return fd.selectList(sst, pv, map);
	}//selectList

	// 게시글 상세 조회 + 조회수 증가
	@Override
	public FreeVo selectOne(String boardNo) {
		
		int result = fd.increaseCnt(sst, boardNo);	// 조회수 증가
		if(result == 1) {
			return fd.selectOne(sst, boardNo);	// 상세 조회
		}else {
			return null;
		}
		
	}//selectOne

	// 게시글 삭제
	@Override
	public int delete(String boardNo) {
		return fd.delete(sst, boardNo);
	}//delete

	// 게시글 작성
	@Override
	public int write(FreeVo vo) {
		return fd.insertBoard(sst, vo);
	}//write

	// 게시글 수정
	@Override
	public int edit(FreeVo vo) {
		return fd.edit(sst, vo);
	}//edit
	
}//class
