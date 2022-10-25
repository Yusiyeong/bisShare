package com.bs.blind.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.blind.dao.BlindDao;
import com.bs.blind.vo.BlindVo;
import com.bs.common.PageVo;

@Service
public class BlindServiceImpl implements BlindService{

	private final SqlSessionTemplate sst;
	private final BlindDao bd;
	
	
	@Autowired
	public BlindServiceImpl(SqlSessionTemplate sst, BlindDao bd) {
		super();
		this.sst = sst;
		this.bd = bd;
	}

	
	// 페이징 처리
	@Override
	public int selectTotalCnt() {
		return bd.selectCountAll(sst);
	}//selectTotalCnt

	// 게시글 목록 조회
	@Override
	public List<BlindVo> selectList(PageVo pv, Map<String, String> map) {
		return bd.selectList(sst, pv, map);
	}//selectList


	// 게시글 상세 조회 + 조회수 증가
	@Override
	public BlindVo selectOne(String boardNo) {
		
		int result = bd.increaseCnt(sst, boardNo);	// 조회수 증가
		if(result == 1) {
			return bd.selectOne(sst, boardNo);	// 상세 조회
		}else {
			return null;
		}
		
	}//selectOne

	// 게시글 삭제
	@Override
	public int delete(String boardNo) {
		return bd.delete(sst, boardNo);
	}//delete


	// 게시글 작성
	@Override
	public int write(BlindVo vo) {
		return bd.insertBoard(sst, vo);
	}//write


	// 수정하기
	@Override
	public int edit(BlindVo vo) {
		return bd.edit(sst, vo);
	}//edit
		
}//class
