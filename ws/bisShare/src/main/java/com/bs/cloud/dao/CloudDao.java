package com.bs.cloud.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.cloud.vo.CloudVo;
import com.bs.common.PageVo;

public interface CloudDao {

	// 페이징 처리
	int selectCountAll(SqlSessionTemplate sst);

	// 게시글 목록 조회
	List<CloudVo> selectList(SqlSessionTemplate sst, PageVo pv, Map<String, String> map);

	// 게시글 작성 + 파일 업로드
	int insertBoard(SqlSessionTemplate sst, CloudVo vo);

	// 조회수 증가
	int increaseCnt(SqlSessionTemplate sst, String boardNo);

	// 게시글 상세 조회
	CloudVo selectOne(SqlSessionTemplate sst, String boardNo);

	// 게시글 수정
	int edit(SqlSessionTemplate sst, CloudVo vo);

	// 게시글 삭제
	int delete(SqlSessionTemplate sst, String boardNo);

}//interface
