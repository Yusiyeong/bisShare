package com.bs.calendar.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bs.calendar.vo.CalendarVo;

@Repository
public class CalendarDaoImpl implements CalendarDao{

	//일정 작성
	@Override
	public int insertCalendar(SqlSessionTemplate sst, CalendarVo vo) {
		return sst.insert("calendarMapper.insertCalendar", vo);
	}

	//일정 삭제
	@Override
	public int delete(SqlSessionTemplate sst, String no) {
		return sst.update("calendarMapper.deleteCalendar", no);
	}

}
