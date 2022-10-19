package com.bs.common;

import lombok.Data;

@Data
public class PageVo {	// 페이징 처리

	private int listCount;	
	private int currentPage;	
	private int pageLimit;		
	private int boardLimit;		
	
	private int maxPage;	
	private int startPage;		
	private int endPage;		
	
}//class
