package com.bs.address.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bs.address.vo.AddressVo;
import com.bs.common.PageVo;

public interface AddressService {

	//주소록 검색 조회
	List<AddressVo> selectSearch(PageVo pvo, Map<String, String> map);

	//조직도 조회
	List<AddressVo> selectList(Map<String, String> map);
	
	//조직도 상세조회
	List<AddressVo> detailList();

	//전체 목록 갯수 조회
	int selectTotalCnt(Map<String, String> map);
	

	

	

}
