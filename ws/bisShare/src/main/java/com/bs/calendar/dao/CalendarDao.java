package com.bs.calendar.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.calendar.vo.CalendarVo;

public interface CalendarDao {

	//일정 작성
	int insertCalendar(SqlSessionTemplate sst, CalendarVo vo);

	//일정 삭제
	int delete(SqlSessionTemplate sst, String no);

}
