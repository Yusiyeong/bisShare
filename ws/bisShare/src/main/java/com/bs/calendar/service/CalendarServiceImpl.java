package com.bs.calendar.service;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.calendar.dao.CalendarDao;
import com.bs.calendar.vo.CalendarVo;
import com.bs.common.PageVo;

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
		
		int result = 0;
		
		try {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy"); 
		    Date parsedSDate = dateFormat.parse(vo.getStartDate());
		    Date parsedEDate = dateFormat.parse(vo.getEndDate());
		    Timestamp timestamp = new java.sql.Timestamp(parsedSDate.getTime());
		    Timestamp timestamp2 = new java.sql.Timestamp(parsedEDate.getTime());
		    vo.setStartDate(timestamp.toString());
		    vo.setEndDate(timestamp2.toString());
		    
		    
		    result = dao.insertCalendar(sst, vo);
		} catch(Exception e) { 
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	//캘린더에서 일정 작성
	@Override
	public int modalwrite(CalendarVo vo) {
		
		int result = 0;
		
		try {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy"); 
		    Date parsedSDate = dateFormat.parse(vo.getStartDate());
		    Date parsedEDate = dateFormat.parse(vo.getEndDate());
		    Timestamp timestamp = new java.sql.Timestamp(parsedSDate.getTime());
		    Timestamp timestamp2 = new java.sql.Timestamp(parsedEDate.getTime());
		    vo.setStartDate(timestamp.toString());
		    vo.setEndDate(timestamp2.toString());
		    
		    
		    result = dao.insertModalCalendar(sst, vo);
		} catch(Exception e) { 
			e.printStackTrace();
		}
		
		return result;
	}

	//일정 삭제
	@Override
	public int delete(String no) {
		return dao.delete(sst, no);
	}

	//일정 수정
	@Override
	public int edit(CalendarVo vo) {
		int result = 0;
		
		try {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy"); 
		    Date parsedSDate = dateFormat.parse(vo.getStartDate());
		    Date parsedEDate = dateFormat.parse(vo.getEndDate());
		    Timestamp timestamp = new java.sql.Timestamp(parsedSDate.getTime());
		    Timestamp timestamp2 = new java.sql.Timestamp(parsedEDate.getTime());
		    vo.setStartDate(timestamp.toString());
		    vo.setEndDate(timestamp2.toString());
		    
		    
		    result = dao.updateOne(sst, vo);
		} catch(Exception e) { 
			e.printStackTrace();
		}
		
		return result;
	}

	//일정 목록 조회
	@Override
	public List<CalendarVo> selectList(PageVo pv, String no) {
		return dao.selectList(sst, pv, no);
	}

	//일정 갯수 조회
	@Override
	public int selectToatalCnt() {
		return dao.selectCountAll(sst);
	}

	//일정 상세조회(번호)
	@Override
	public CalendarVo selectOne(String no) {
		return dao.selectOne(sst, no);
	}


}
