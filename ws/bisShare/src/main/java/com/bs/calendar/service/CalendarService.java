package com.bs.calendar.service;

import com.bs.calendar.vo.CalendarVo;

public interface CalendarService {

	//일정 작성
	int write(CalendarVo vo);

	//일정 삭제
	int delete(String no);

}
