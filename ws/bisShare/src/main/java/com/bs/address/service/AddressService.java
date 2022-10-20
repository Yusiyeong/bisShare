package com.bs.address.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bs.address.vo.AddressVo;
import com.bs.common.PageVo;

public interface AddressService {

	//주소록 조회
	List<AddressVo> selectList(PageVo pvo, Map<String, String> map);

	//조직도 상세조회
	List<AddressVo> detailList();

	int selectListCount(Map<String, String> map);

	

	

}
