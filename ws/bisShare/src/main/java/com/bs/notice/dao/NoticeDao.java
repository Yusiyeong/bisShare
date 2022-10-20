package com.bs.notice.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.common.PageVo;
import com.bs.notice.vo.NoticeVo;

public interface NoticeDao {

	// 페이징 처리
	int selectCountAll(SqlSessionTemplate sst);

	// 게시글 목록 조회
	List<NoticeVo> selectList(SqlSessionTemplate sst, PageVo pv, Map<String, String> map);


}//interface
