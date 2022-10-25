package com.bs.free.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.common.PageVo;
import com.bs.free.vo.FreeVo;
import com.bs.notice.vo.NoticeVo;

public interface FreeDao {

	// 페이징 처리
	int selectCountAll(SqlSessionTemplate sst);

	// 게시글 목록 조회
	List<FreeVo> selectList(SqlSessionTemplate sst, PageVo pv, Map<String, String> map);

	// 조회수 증가
	int increaseCnt(SqlSessionTemplate sst, String boardNo);

	// 게시글 상세 조회
	FreeVo selectOne(SqlSessionTemplate sst, String boardNo);

	// 게시글 삭제
	int delete(SqlSessionTemplate sst, String boardNo);

	// 게시글 작성
	int insertBoard(SqlSessionTemplate sst, FreeVo vo);

	// 게시글 수정
	int edit(SqlSessionTemplate sst, FreeVo vo);
	
	
	
	
}//interface
