package com.bs.calendar.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.calendar.dao.CalendarDao;
import com.bs.calendar.vo.CalendarVo;

@Service
public class CalendarServiceImpl implements CalendarService{
	
	private final CalendarDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public CalendarServiceImpl(CalendarDao dao , SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//일정 작성
	@Override
	public int write(CalendarVo vo) {
		return dao.insertCalendar(sst, vo);
	}

	//일정 삭제
	@Override
	public int delete(String no) {
		return dao.delete(sst, no);
	}

}
