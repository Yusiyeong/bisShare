package com.bs.calendar.service;

import java.util.List;

import com.bs.calendar.vo.CalendarVo;
import com.bs.common.PageVo;

public interface CalendarService {

	//일정 작성
	int write(CalendarVo vo);

	//일정 삭제
	int delete(String no);

	//일정 수정
	int edit(CalendarVo vo);

	//일정 목록 조회
	List<CalendarVo> selectList(PageVo pv);
	
	//전체 일정 갯수 조회
	int selectToatalCnt();


}
