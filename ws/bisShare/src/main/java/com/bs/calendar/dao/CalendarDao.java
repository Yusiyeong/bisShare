package com.bs.calendar.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.calendar.vo.CalendarVo;
import com.bs.common.PageVo;

public interface CalendarDao {

	//일정 작성
	int insertCalendar(SqlSessionTemplate sst, CalendarVo vo);

	//캘린더에서 일정 작성
	int insertModalCalendar(SqlSessionTemplate sst, CalendarVo vo);
	
	//일정 삭제
	int delete(SqlSessionTemplate sst, String no);

	//일정 수정
	int updateOne(SqlSessionTemplate sst, CalendarVo vo);

	//일정 목록 조회
	List<CalendarVo> selectList(SqlSessionTemplate sst, PageVo pv, String no);

	//일정 갯수 조회
	int selectCountAll(SqlSessionTemplate sst);

	//일정 상세 조회 (번호)
	CalendarVo selectOne(SqlSessionTemplate sst, String no);


}
