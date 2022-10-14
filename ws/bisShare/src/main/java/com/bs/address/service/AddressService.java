package com.bs.address.service;

import java.util.List;

import com.bs.address.vo.AddressVo;

public interface AddressService {

	//주소록 조회
	List<AddressVo> selectList();

	

}
