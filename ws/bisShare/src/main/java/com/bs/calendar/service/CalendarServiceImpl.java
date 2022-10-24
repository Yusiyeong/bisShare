package com.bs.calendar.service;

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
		return dao.insertCalendar(sst, vo);
	}

	//일정 삭제
	@Override
	public int delete(String no) {
		return dao.delete(sst, no);
	}

	//일정 수정
	@Override
	public int edit(CalendarVo vo) {
		return dao.updateOne(sst, vo);
	}

	//일정 목록 조회
	@Override
	public List<CalendarVo> selectList(PageVo pv) {
		return dao.selectList(sst, pv);
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
